package iteration

import (
	"fmt"
	"testing"
)

func TestRepeat(t *testing.T) {
	repeated := Repeat("a")
	expected := "aaaaa"
	if repeated != expected {
		t.Errorf("expected %q but got %q", expected, repeated)
	}
}

func BenchmarkRepeat(b *testing.B) {
	for b.Loop() {
		Repeat("a")
	}
	// for i := 0; i < b.N; i++ {
	// 	Repeat("a")
	// }
}

// benchmark result
// goos: darwin
// goarch: arm64
// pkg: learn-go-with-tests/iteration
// cpu: Apple M2 Pro
// === RUN   BenchmarkRepeat
// BenchmarkRepeat
// BenchmarkRepeat-10      14388882                83.15 ns/op        16 B/op          4 allocs/op
// PASS
// ok      learn-go-with-tests/iteration   1.471s

func BenchmarkRepeatWithBuilder(b *testing.B) {
	for b.Loop() {
		RepeatWithBuilder("a")
	}
	// for i := 0; i < b.N; i++ {
	// 	Repeat("a")
	// }
}

// benchmark result
// goos: darwin
// goarch: arm64
// pkg: learn-go-with-tests/iteration
// cpu: Apple M2 Pro
// === RUN   BenchmarkRepeatWithBuilder
// BenchmarkRepeatWithBuilder
// BenchmarkRepeatWithBuilder-10           41047750            29.05 ns/op             8 B/op          1 allocs/op
// PASS
// ok      learn-go-with-tests/iteration   1.386s

func ExampleRepeat() {
	output := Repeat("a")
	fmt.Print(output)
	// Output: aaaaa

}
