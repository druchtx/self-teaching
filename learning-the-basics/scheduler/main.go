package main

import (
	"fmt"
	"runtime"
)

func main() {

	fmt.Printf("Number of CPUs: %d\nNumber of Goroutines: %d\n", runtime.NumCPU(), runtime.NumGoroutine())

}

