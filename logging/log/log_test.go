package log

import (
	"log"
	"os"
	"testing"
)

func TestLog(t *testing.T) {

	t.Run("log.New", func(t *testing.T) {
		t.Run("New", func(t *testing.T) {
			l := log.New(os.Stdout, "[ PREFIX ] ", log.LstdFlags|log.Lmsgprefix)
			l.Print("hello!!")
		})

	})

}
