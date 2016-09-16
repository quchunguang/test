package main

import (
	"fmt"
)

type Set map[interface{}]bool

func New() Set {
	return make(Set)
}

func (s Set) insert(values ...interface{}) {
	for _, v := range values {
		s[v] = true
	}
}

func (s1 Set) threepart(s2 Set) (p1, p2, p3 Set) {
	p1 = New()
	p2 = New()
	p3 = New()

	for k, _ := range s1 {
		if _, ok := s2[k]; ok {
			p2[k] = true
		} else {
			p1[k] = true
		}
	}

	for k, _ := range s2 {
		if _, ok := s1[k]; !ok {
			p3[k] = true
		}
	}
	return
}

func (s1 Set) intersection(s2 Set) (r Set) {
	r = New()
	for k, _ := range s1 {
		if _, ok := s2[k]; ok {
			r[k] = true
		}
	}
	return
}

func (s1 Set) union(s2 Set) (r Set) {
	r = New()
	for k, _ := range s1 {
		r[k] = true
	}

	for k, _ := range s2 {
		r[k] = true
	}
	return
}

func (s1 Set) difference(s2 Set) (r Set) {
	r = New()
	for k, _ := range s1 {
		if _, ok := s2[k]; !ok {
			r[k] = true
		}
	}
	return
}

func (s1 Set) symmetric_difference(s2 Set) (r Set) {
	r = New()
	for k, _ := range s1 {
		if _, ok := s2[k]; !ok {
			r[k] = true
		}
	}

	for k, _ := range s2 {
		if _, ok := s1[k]; !ok {
			r[k] = true
		}
	}
	return
}

func (s Set) Do(f func(interface{})) {
	for k, _ := range s {
		f(k)
	}
}

//////////////////////////////////////////////////////
func (s Set) p() {
	fmt.Print("{")
	s.Do(func(v interface{}) {
		fmt.Print(v, ",")
	})
	fmt.Println("}")
}

func main() {
	s1 := New()
	s2 := New()
	s1.insert(1, 2, 3)
	s2.insert(2, 3, 4)
	s1[1] = true  // insert already exist item by hand
	delete(s1, 6) // remove not exist item

	p1, p2, p3 := s1.threepart(s2)
	p1.p()
	p2.p()
	p3.p()

	fmt.Print("s1.intersection(s2): ")
	s1.intersection(s2).p()

	fmt.Print("s1.union(s2): ")
	s1.union(s2).p()

	fmt.Print("s1.difference(s2): ")
	s1.difference(s2).p()

	fmt.Print("s1.symmetric_difference(s2): ")
	s1.symmetric_difference(s2).p()
}
