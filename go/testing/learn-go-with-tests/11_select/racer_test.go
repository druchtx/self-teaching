package racer

import (
	"net/http"
	"net/http/httptest"
	"testing"
	"time"
)

func TestRacer(t *testing.T) {
	slowServer := makeDelayServer(20 * time.Microsecond)
	fastServer := makeDelayServer(0)
	defer slowServer.Close()
	defer fastServer.Close()

	slowUrl := slowServer.URL
	fastUrl := fastServer.URL

	want := fastUrl

	got := Racer(slowUrl, fastUrl)

	if got != want {
		t.Errorf("got %q, want %q", got, want)
	}
}

func TestRacerAsync(t *testing.T) {
	t.Run("compares speeds of servers, returning the url of the fastest one", func(t *testing.T) {
		slowServer := makeDelayServer(20 * time.Microsecond)
		fastServer := makeDelayServer(0)

		defer slowServer.Close()
		defer fastServer.Close()

		slowUrl := slowServer.URL
		fastUrl := fastServer.URL

		want := fastUrl
		got := Racer(slowUrl, fastUrl)
		if got != want {
			t.Errorf("got %q, want %q", got, want)
		}
	})

	t.Run("returns an error if a server doesn't respond within 10s", func(t *testing.T) {
		serverA := makeDelayServer(11 * time.Second)
		serverB := makeDelayServer(12 * time.Second)

		defer serverA.Close()
		defer serverB.Close()

		_, err := RacerAsync(serverA.URL, serverB.URL)

		if err == nil {
			t.Error("expected an error but didn't get one")
		}
	})

	t.Run("returns an error if a server doesn't respond within the specified time", func(t *testing.T) {
		server := makeDelayServer(25 * time.Microsecond)

		defer server.Close()

		_, err := ConfigurableRacer(server.URL, server.URL, 20*time.Microsecond)

		if err == nil {
			t.Error("expected an error but didn't get one")
		}
	})
}

func makeDelayServer(delay time.Duration) *httptest.Server {
	return httptest.NewServer(
		http.HandlerFunc(
			func(w http.ResponseWriter, r *http.Request) {
				time.Sleep(delay)
				w.WriteHeader(http.StatusOK)
			},
		))
}
