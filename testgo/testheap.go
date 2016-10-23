package main

import (
	"container/heap"
	"fmt"
)

//heap提供了接口，需要自己实现如下方法
type Heap []int

//构造的是小顶堆，大顶堆只需要改一下下面的符号
func (h *Heap) Less(i, j int) bool {
	return (*h)[i] < (*h)[j]
}

func (h *Heap) Swap(i, j int) {
	(*h)[i], (*h)[j] = (*h)[j], (*h)[i]
}

func (h *Heap) Len() int {
	return len(*h)
}

func (h *Heap) Pop() interface{} {
	x := (*h)[h.Len()-1]
	*h = (*h)[:h.Len()-1]
	return x
}

func (h *Heap) Push(x interface{}) {
	*h = append(*h, x.(int))
}

func (h *Heap) Remove(idx int) interface{} {
	h.Swap(idx, h.Len()-1)
	return h.Pop()
}

func main() {

	//创建一个heap
	h := &Heap{}

	heap.Init(h)
	//向heap中插入元素
	h.Push(5)
	h.Push(2)
	h.Push(1)
	h.Push(8)
	h.Push(4)
	h.Push(6)
	h.Push(2)

	//输出heap中的元素，相当于一个数组，原始数组
	fmt.Println(h)

	//这里必须要reheapify，建立好堆了
	heap.Init(h)

	//小顶堆对应的元素在数组中的位置
	fmt.Println(h)

	//移除下标为5的元素，下标从0开始
	h.Remove(5)

	//按照堆的形式输出
	for h.Len() > 0 {
		fmt.Printf("%d ", heap.Pop(h))
	}
	fmt.Println()
}
