package di

import (
	"fmt"
	"io"
)

// func Greet(writer *bytes.Buffer, name string) {
// 	fmt.Fprintf(writer, "Hello, %s", name)
// }

func Greet(writer io.Writer, name string) {
	fmt.Fprintf(writer, "Hello, %s", name)
}
