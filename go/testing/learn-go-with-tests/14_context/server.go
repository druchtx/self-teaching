package context

import (
	"context"
	"fmt"
	"log/slog"
	"net/http"
)

func Server(store Store) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		data, err := store.Fetch(r.Context())
		if err != nil {
			slog.Default().Error("error occurred ", slog.Any("err", err))
			return
		}

		fmt.Fprint(w, data)
	}
}

type Store interface {
	Fetch(ctx context.Context) (string, error)
}
