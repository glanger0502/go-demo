package main

import (
	"fmt"
	"net/http"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "hello world")
	fmt.Fprintln(w, "test")
}

func main() {
	http.HandleFunc("/", indexHandler)
	err := http.ListenAndServe(":8081", nil)
	if err != nil {
		return
	}
}
