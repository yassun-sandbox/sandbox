package main

import (
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/ec2"
	"github.com/olekukonko/tablewriter"
	"os"
)

func main() {

	svc := ec2.New(&aws.Config{Region: "ap-northeast-1"})
	res, err := svc.DescribeInstances(nil)
	if err != nil {
		panic(err)
	}
	table := tablewriter.NewWriter(os.Stdout)
	table.SetHeader([]string{"Tag Name", "Instance Id", "Instance Type", "AZ", "IP", "Status"})
	for _, r := range res.Reservations {
		for _, i := range r.Instances {
			for _, t := range i.Tags {
				if *t.Key == "Name" {
					table.Append([]string{*t.Value, *i.InstanceID, *i.InstanceType, *i.Placement.AvailabilityZone, *i.PrivateIPAddress, *i.State.Name})
				}
			}

		}
	}
	table.Render()

}
