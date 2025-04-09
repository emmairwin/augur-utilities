//This program generated using ChatGPT with the prompt, please rewrite this python program (cloner.py) in GO.
//

package main

import (
	"bufio"
	"fmt"
	"os"
	"os/exec"
	"path"
	"strings"
	"sync"
)

const (
	repoListFile = "repos.txt"
	cloneDir     = "cloned_repos"
	maxWorkers   = 20
)

// normalizeURL ensures the URL has https:// or git@ and points to github
func normalizeURL(raw string) string {
	raw = strings.TrimSpace(raw)
	if raw == "" {
		return ""
	}
	if strings.HasPrefix(raw, "https://") || strings.HasPrefix(raw, "git@") {
		return raw
	}
	if strings.HasPrefix(raw, "github.com") {
		return "https://" + raw
	}
	if !strings.Contains(raw, "/") {
		return ""
	}
	return "https://github.com/" + raw
}

// cloneRepo clones a repo into the target directory
func cloneRepo(url string, wg *sync.WaitGroup, sem chan struct{}) {
	defer wg.Done()
	sem <- struct{}{}        // Acquire semaphore
	defer func() { <-sem }() // Release semaphore

	parts := strings.Split(strings.TrimSuffix(url, "/"), "/")
	repoName := strings.TrimSuffix(parts[len(parts)-1], ".git")
	targetPath := path.Join(cloneDir, repoName)

	if _, err := os.Stat(targetPath); err == nil {
		fmt.Printf("[SKIPPED] %s already exists.\n", repoName)
		return
	}

	cmd := exec.Command("git", "clone", url, targetPath)
	out, err := cmd.CombinedOutput()
	if err != nil {
		fmt.Printf("[ERROR] Failed to clone %s: %s\n", url, string(out))
		return
	}
	fmt.Printf("[CLONED] %s\n", url)
}

func readURLs(file string) ([]string, error) {
	f, err := os.Open(file)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	urlMap := make(map[string]struct{})
	scanner := bufio.NewScanner(f)

	for scanner.Scan() {
		line := normalizeURL(scanner.Text())
		if line != "" {
			urlMap[line] = struct{}{}
		}
	}

	if err := scanner.Err(); err != nil {
		return nil, err
	}

	urls := make([]string, 0, len(urlMap))
	for url := range urlMap {
		urls = append(urls, url)
	}
	return urls, nil
}

func main() {
	if err := os.MkdirAll(cloneDir, 0755); err != nil {
		fmt.Println("Failed to create clone directory:", err)
		return
	}

	urls, err := readURLs(repoListFile)
	if err != nil {
		fmt.Println("Error reading repo list:", err)
		return
	}

	var wg sync.WaitGroup
	sem := make(chan struct{}, maxWorkers)

	for _, url := range urls {
		wg.Add(1)
		go cloneRepo(url, &wg, sem)
	}

	wg.Wait()
}
