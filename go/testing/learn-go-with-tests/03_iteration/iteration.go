package iteration

import "strings"

const repeatCount = 5

func Repeat(character string) string {
	var repeated string
	for range repeatCount {
		repeated += character
	}
	return repeated
}

func RepeatWithBuilder(character string) string {
	var repeated strings.Builder
	for i := 0; i < repeatCount; i++ {
		repeated.WriteString(character)
	}
	return repeated.String()
}
