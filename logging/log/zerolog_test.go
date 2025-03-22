package log

import (
	"testing"
	"time"

	"github.com/rs/zerolog"
	"github.com/rs/zerolog/log"
)

func TestZeroLog(t *testing.T) {
	zerolog.TimeFieldFormat = time.RFC3339

	log.Info().Msg("Hello")
}
