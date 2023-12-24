package main

import "fmt"

func main() {
	rand := []int{4, 3, 78, 2, 0, 2}

	ord := mrBubbles(rand)

	fmt.Printf("%v", ord)
}

func mrBubbles(rand []int) []int {
	for i := 0; i < len(rand)-1; i++ {
		for j := 0; j < len(rand)-1; j++ {
			swap(rand, j)
		}
	}
	return rand
}

func swap(arr []int, i int) {
	if arr[i] > arr[i+1] {
		arr[i], arr[i+1] = arr[i+1], arr[i]
	}
}
