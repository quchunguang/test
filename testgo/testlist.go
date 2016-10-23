package main

import (
	"container/list"
	"fmt"
)

func main() {

	//创建一个双向链表
	ls := list.New()

	//向双向链表中插入26个小写字母
	for i := 97; i < 123; i++ {
		ls.PushFront(i) //PushFront()代表从头部插入，同样PushBack()代表从尾部插入
	}

	//遍历双向链表ls中的所有字母
	for it := ls.Front(); it != nil; it = it.Next() {
		fmt.Printf("%c ", it.Value)
	}
	fmt.Println()
}
