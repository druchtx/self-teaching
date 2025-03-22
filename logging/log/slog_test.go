package log

import (
	"log/slog"
	"os"
	"testing"
)

func TestSlog(t *testing.T) {
	slog.Info("test", "a", "2")
	logger := slog.New(slog.NewJSONHandler(os.Stdout, nil))
	logger = logger.With("slog", "test")
	logger.Info("hello", "count", 3)
}
