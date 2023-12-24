package main

import (
	"errors"
	"fmt"
)

func main() {
	prices := []int{17, 3, 6, 9, 15, 8, 6, 1, 10}

	days, err := stonks(prices)
	if err != nil {
		print(err.Error())
		return
	}
	fmt.Println(days)
}

func stonks(prices []int) ([]int, error) {
	if len(prices) < 2 {
		return []int{}, errors.New("Prices must have at least 2 values")
	}
	profit := 0
	low := prices[0]
	lowI := 0
	days := make([]int, 2)

	for i, v := range prices {
		if v < low {
			low = v
			lowI = i
			continue
		}

		if v-low > profit {
			profit = v - low
			days[0], days[1] = lowI, i
		}
	}
	return days, nil
}
