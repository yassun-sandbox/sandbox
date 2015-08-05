package main

import (
	"fmt"
	"github.com/k0kubun/pp"
	"gopkg.in/redis.v3"
)

func main() {
	client := ExampleNewClient()
	ExampleSetGet(client)
	ExampleHMSetGet(client)
	ExampleList(client)
}

func ExampleNewClient() *redis.Client {
	client := redis.NewClient(&redis.Options{
		Addr:     "localhost:6379",
		Password: "",
		DB:       0,
	})
	return client
}

func ExampleSetGet(client *redis.Client) {
	pong, err := client.Ping().Result()
	fmt.Println(pong, err)

	err = client.Set("hogehoge", "value", 0).Err()
	if err != nil {
		panic(err)
	}

	val, err := client.Get("key").Result()
	if err != nil {
		panic(err)
	}
	fmt.Println("key", val)

	val2, err := client.Get("key2").Result()
	if err == redis.Nil {
		fmt.Println("key2 does not exists")
	} else if err != nil {
		panic(err)
	} else {
		fmt.Println("key2", val2)
	}
}
func ExampleHMSetGet(client *redis.Client) {
	statusCmd := client.HMSet("HMsetkey1", "field1", "value1", "field2", "value2")
	pp.Print(statusCmd)

	stringMapCmd := client.HGetAllMap("HMsetkey1")
	stringmap := stringMapCmd.Val()
	fmt.Println(stringmap["field1"])

}

func ExampleList(client *redis.Client) {
	client.Del("List")

	client.LPush("List", "key1")
	client.LPush("List", "key2")
	client.LPush("List", "key3")
	client.LPush("List", "key4")
	client.LPush("List", "key5")

	stringSliceCmd := client.LRange("List", 0, 10)
	pp.Print(stringSliceCmd.Val())

}
