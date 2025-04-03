package main

import "fmt"

func main() {
	greeting := Hello("World")
	fmt.Print(greeting)
}

func Hello(name string) string {
	return "Hello," + name
}
