package integers

import (
	"fmt"
	"testing"
)

func TestAdder(t *testing.T) {
	sum := Add(2, 2)
	want := 4

	if sum != want {
		t.Errorf("got: '%d'  want '%d'", sum, want)
	}
}

// https://go.dev/blog/examples
// go example starts with Example
// Output is the expected result,if no Output provided,the test will only compiles but not run
func ExampleAdd() {
	fmt.Println(Add(1, 1))
	// Output: 2
}
