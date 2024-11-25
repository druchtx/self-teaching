package main

func main() {
	SayHello()
}

// SayHello prints "Hello World"
//
// 执行 go generate -run d 	则会 执行 docker ps
// -command  xxx 为后面的命令设置一个shorthand
//
//go:generate  -command d docker ps
//go:generate d
func SayHello() {
	println("Hello World from golang")
}
