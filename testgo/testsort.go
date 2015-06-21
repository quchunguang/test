package main

import (
	"fmt"
	"sort"
)

// Animals ...
type Animals []string

func (a Animals) Len() int           { return len(a) }
func (a Animals) Less(i, j int) bool { return len(a[i]) < len(a[j]) }
func (a Animals) Swap(i, j int)      { a[i], a[j] = a[j], a[i] }

func main() {
	animals := []string{"cat", "bird", "zebra", "fox"}
	// Sort by strings.
	sort.Strings(animals)
	fmt.Println(animals) //[bird cat fox zebra]

	//sort by len
	an := Animals{"cat", "bird", "zebra", "fox"}
	sort.Sort(an)
	fmt.Println(an) //[cat fox bird zebra]
}
