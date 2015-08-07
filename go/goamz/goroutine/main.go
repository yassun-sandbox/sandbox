package main

import (
	"flag"
	"github.com/mitchellh/goamz/aws"
	"github.com/mitchellh/goamz/s3"
	"strconv"
	"sync"
)

var (
	bucketName string
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
	var wg sync.WaitGroup
	for i := 0; i < 10; i++ {
		wg.Add(1)
		go func(filename string) {
			defer wg.Done()
			err = bucket.Put(filename+".txt", data, "text/plain", s3.BucketOwnerFull)
			if err != nil {
				panic(err.Error())
			}
		}(strconv.Itoa(i))
	}

	wg.Wait()
}
