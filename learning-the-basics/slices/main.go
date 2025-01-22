package main

import (
	"fmt"
)

var buffer [30]byte

func AddOneToEachElement(slice []byte) {
	for i := range slice {
		slice[i]++
	}
}
func main() {
	slice := buffer[10:20]
	for i := 0; i < len(slice); i++ {
		slice[i] = byte(i)
	}
	fmt.Println("before", slice)
	AddOneToEachElement(slice)
	fmt.Println("after", slice)
	fmt.Println("buffer", buffer)
}
