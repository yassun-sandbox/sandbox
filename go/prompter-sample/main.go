package main

import (
	"fmt"
	"regexp"

	"github.com/Songmu/prompter"
)

func main() {
	input := (&prompter.Prompter{
		Choices:    []string{"1", "2", "3", "9"},
		Default:    "9",
		Message:    "plaase select",
		IgnoreCase: true,
	}).Prompt()
	fmt.Println("your input is " + input)

	input = (&prompter.Prompter{
		Message: "enter password",
		Regexp:  regexp.MustCompile(`.{8,}`),
		NoEcho:  true,
	}).Prompt()
	fmt.Println("your password is " + input)

	if prompter.YN("do you like Perl?", true) {
		fmt.Println("Nice!")
	} else {
		fmt.Println("It's Okay.")
	}

}
