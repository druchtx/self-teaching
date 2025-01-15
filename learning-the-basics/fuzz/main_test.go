package main

import (
	"testing"
	"unicode/utf8"
)

// fuzz test
// run fuzztest by `go test -fuzz FuzzReverse`
func FuzzReverse(f *testing.F) {
	testcases := []string{"Hello, world"}
	for _, tc := range testcases {
		// Use f.Add to provide a seed corpus
		f.Add(tc)
	}

	f.Fuzz(func(t *testing.T, orig string) {
		rev, err1 := Reverse(orig)
		if err1 != nil {
			return
		}
		doubleRev, err2 := Reverse(rev)
		if err2 != nil {
			return
		}
		if orig != doubleRev {
			t.Errorf("Before: %q, after: %q", orig, doubleRev)
		}
		if utf8.ValidString(orig) && !utf8.ValidString(rev) {
			t.Errorf("Reverse produced invalid UTF-8 string %q", rev)
		}
	})

}
