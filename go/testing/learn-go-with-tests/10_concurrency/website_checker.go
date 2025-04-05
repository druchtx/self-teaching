package concurrency

import "time"

type WebsiteChecker func(string) bool
type result struct {
	string
	bool
}

func CheckWebsites(wc WebsiteChecker, urls []string) map[string]bool {
	results := make(map[string]bool)
	rchan := make(chan result)

	for _, url := range urls {
		go func() {
			rchan <- result{url, wc(url)}
		}()
	}
	for range len(urls) {
		r := <-rchan
		results[r.string] = r.bool
	}
	return results
}

func slowStubWebsiteChecker(_ string) bool {
	time.Sleep(20 * time.Millisecond)
	return true
}
