package main

import "testing"

func TestHello(t *testing.T) {
	got := Hello("World")
	want := "Hello,World"

	AssertGreeting(t, got, want)
}

// testing.TB is an interface that satisfy both the testing.B and testing.T
func AssertGreeting(t testing.TB, got, want string) {
	// t.Helper will report the line in function call rather than the test Hel
	t.Helper()
	if got != want {
		t.Errorf("got %q want %q", got, want)
	}

}
