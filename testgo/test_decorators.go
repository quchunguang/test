package main

import (
	"fmt"
	"log"
	"net/http"
)

var hiHandler = authRequired(func(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hi, %v\n", r.FormValue("user"))
})

func authRequired(f http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.FormValue("user") == "" {
			http.Error(w, "access denided", http.StatusForbidden)
			return
		}
		f(w, r)
	}
}

func main() {
	http.HandleFunc("/hi", hiHandler)
	err := http.ListenAndServe(":9000", nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}
