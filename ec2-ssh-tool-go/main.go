package main

import (
	"flag"
	"fmt"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/ec2"
	"github.com/aws/aws-sdk-go/service/s3"
	"github.com/aws/aws-sdk-go/service/s3/s3manager"
	"github.com/bitly/go-simplejson"
	"github.com/olekukonko/tablewriter"
	"io/ioutil"
	"net/http"
	"os"
	"path/filepath"
	"regexp"
	"sort"
	"strconv"
)

type Ec2Instance struct {
	tagName, instanceID, instanceType, availabilityZone, ip, stageName string
}
type Ec2Instances []Ec2Instance

func (e Ec2Instances) Less(i, j int) bool {
	return e[i].tagName < e[j].tagName
}
func (e Ec2Instances) Len() int {
	return len(e)
}
func (e Ec2Instances) Swap(i, j int) {
	e[i], e[j] = e[j], e[i]
}

func main() {
	sshStartFlag := flag.Bool("s", false, "SSH Start")
	sshEndFlag := flag.Bool("e", false, "SSH End")
	flag.Parse()
	if *sshStartFlag {
		startSSH()
	} else if *sshEndFlag {
		endSSH()
	} else {
		flag.PrintDefaults()
	}
}

func startSSH() {
	// グローバルIPの取得
	globalIp, err := getGlobalIp()
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println("Get GlobalIP : " + globalIp)

	// EC2インスタンスの選択
	ec2Instance, err := selectEc2Instance()
	if err != nil {
		fmt.Println(err)
		return
	}

	// セキュリティグループIDの取得
	securityGroupId, err := getSecurityGroupId(ec2Instance.instanceID)
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println("Get SecurityGroupID : " + securityGroupId)

	// セキュリティグループに自身のグローバルIPを追加
	addSecurityGroup(globalIp, securityGroupId)
	fmt.Println("Add GlobalIP : " + globalIp + " >> SecurityGroupID : " + securityGroupId)

	// SSHKeyの取得
	sshKeyPath, err := getSshKey(ec2Instance.tagName)
	if err != nil {
		fmt.Println(err)
		return
	}

	// SSHコマンドの表示
	fmt.Printf(" > ssh -i %s ec2-user@%s\n", sshKeyPath, ec2Instance.ip)
}

func getGlobalIp() (ip string, err error) {

	http_res, err := http.Get("http://httpbin.org/ip")
	if err != nil {
		return ip, err
	}

	defer http_res.Body.Close()

	byteArray, err := ioutil.ReadAll(http_res.Body)
	if err != nil {
		return ip, err
	}

	js, err := simplejson.NewJson(byteArray)
	if err != nil {
		return ip, err
	}

	ip, err = js.Get("origin").String()
	if err != nil {
		return ip, err
	}

	return ip, err

}

func selectEc2Instance() (ec2Instance Ec2Instance, err error) {
	svc := ec2.New(&aws.Config{Region: "ap-northeast-1"})
	res, err := svc.DescribeInstances(nil)
	if err != nil {
		fmt.Println(err)
		return ec2Instance, err
	}

	ec2instances := Ec2Instances{}
	for _, r := range res.Reservations {
		for _, i := range r.Instances {
			if *i.State.Name != "running" {
				continue
			}
			var tagName string
			var stageName string
			for _, t := range i.Tags {
				if *t.Key == "Name" {
					tagName = *t.Value
				}
				if *t.Key == "Stage" {
					stageName = *t.Value
				}
			}
			ec2instances = append(ec2instances, Ec2Instance{tagName: tagName, instanceID: *i.InstanceID, instanceType: *i.InstanceType, availabilityZone: *i.Placement.AvailabilityZone, ip: *i.PublicIPAddress, stageName: stageName})
		}
	}

	table := tablewriter.NewWriter(os.Stdout)
	table.SetHeader([]string{"No", "Tag Name", "Stage", "Instance Id", "Instance Type", "AZ", "IP"})
	sort.Sort(ec2instances)
	for i, ec2instance := range ec2instances {
		table.Append([]string{
			strconv.Itoa(i),
			ec2instance.tagName,
			ec2instance.stageName,
			ec2instance.instanceID,
			ec2instance.instanceType,
			ec2instance.availabilityZone,
			ec2instance.ip,
		})
	}
	table.Render()

	var input string
	fmt.Print("TARGET INSTANCE NO > ")
	fmt.Scanln(&input)
	i, err := strconv.Atoi(input)
	if err != nil {
		return ec2Instance, err
	}

	return ec2instances[i], err
}

func getSecurityGroupId(instanceId string) (securityGroupId string, err error) {
	svc := ec2.New(&aws.Config{Region: "ap-northeast-1"})
	params := &ec2.DescribeInstancesInput{
		InstanceIDs: []*string{
			aws.String(instanceId),
		},
	}

	// インスタンス情報の取得
	resp, err := svc.DescribeInstances(params)
	if err != nil {
		return securityGroupId, err
	}

	// セキュリティグループIDを取得
	for _, groupIdentifier := range resp.Reservations[0].Instances[0].SecurityGroups {
		r := regexp.MustCompile(`Maintainer`)
		if r.MatchString(*groupIdentifier.GroupName) {
			securityGroupId = *groupIdentifier.GroupID
			break
		}
	}

	return securityGroupId, err
}

func getSshKey(tagName string) (sshKeyPath string, err error) {

	sshConfig := readConfig(tagName)
	bucket := sshConfig.bucket
	key := sshConfig.key

	s3manager := s3manager.NewDownloader(&s3manager.DownloadOptions{S3: s3.New(&aws.Config{Region: "ap-northeast-1"})})

	sshKeyPath = filepath.Join("./tmp/", key)
	if err := os.MkdirAll(filepath.Dir(sshKeyPath), 0775); err != nil {
		return sshKeyPath, err
	}

	fd, err := os.Create(sshKeyPath)
	if err != nil {
		return sshKeyPath, err
	}

	err = os.Chmod(sshKeyPath, 0600)
	if err != nil {
		return sshKeyPath, err
	}
	defer fd.Close()

	fmt.Printf("SSH KEY Download s3://%s/%s to %s...\n", bucket, key, sshKeyPath)

	s3_params := &s3.GetObjectInput{Bucket: &bucket, Key: &key}
	_, err = s3manager.Download(fd, s3_params)
	if err != nil {
		return sshKeyPath, err
	}

	return sshKeyPath, err
}

func addSecurityGroup(globalIp string, securityGroupId string) (err error) {
	svc := ec2.New(&aws.Config{Region: "ap-northeast-1"})
	sec_params := &ec2.AuthorizeSecurityGroupIngressInput{
		CIDRIP:     aws.String(globalIp + "/32"),
		GroupID:    aws.String(securityGroupId),
		IPProtocol: aws.String("tcp"),
		ToPort:     aws.Long(22),
		FromPort:   aws.Long(22),
	}
	_, err = svc.AuthorizeSecurityGroupIngress(sec_params)
	return err
}

func endSSH() {
}
