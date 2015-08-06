package main

import (
	"flag"
	"github.com/mitchellh/goamz/aws"
	"github.com/mitchellh/goamz/s3"
)

var (
	bucketName string
	fileName   string
)

func init() {
	flag.StringVar(&bucketName, "b", "", "Bucket Name")
}

func main() {

	flag.Parse()

	auth, err := aws.EnvAuth()
	if err != nil {
		panic(err.Error())
	}

	s := s3.New(auth, aws.APNortheast)
	bucket := s.Bucket(bucketName)

	data := []byte("Hello S3!!!!")
	err = bucket.Put("sample.txt", data, "text/plain", s3.BucketOwnerFull)
	if err != nil {
		panic(err.Error())
	}
}
