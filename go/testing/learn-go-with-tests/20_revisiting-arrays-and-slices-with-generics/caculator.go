package revisitingarraysandsliceswithgenerics

// func Sum(numbers []int) int {
// 	var sum int
// 	for _, v := range numbers {
// 		sum += v
// 	}
// 	return sum
// }

// func SumAllTails(numbersToSum ...[]int) []int {
// 	var sums []int

// 	for _, numbers := range numbersToSum {
// 		if len(numbers) == 0 {
// 			sums = append(sums, 0)
// 		} else {
// 			tail := numbers[1:]
// 			sums = append(sums, Sum(tail))
// 		}
// 	}
// 	return sums
// }

func Reduce[A, B any](collection []A, fn func(B, A) B, initialValue B) B {
	var result = initialValue

	for _, v := range collection {
		result = fn(result, v)
	}
	return result
}

func Sum(numbers []int) int {
	add := func(acc, x int) int {
		return acc + x
	}
	return Reduce(numbers, add, 0)

}

func SumAllTails(numbers ...[]int) []int {

	sumTail := func(acc, x []int) []int {
		if len(x) == 0 {
			return append(acc, 0)
		}
		tail := x[1:]
		return append(acc, Sum(tail))
	}

	return Reduce(numbers, sumTail, []int{})
}
