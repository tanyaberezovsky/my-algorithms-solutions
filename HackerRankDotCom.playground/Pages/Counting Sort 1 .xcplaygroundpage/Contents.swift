//: [Previous](@previous)

import Foundation

func countingSort(arr: [Int]) -> [Int] {
    var countingArr = [Int](repeating: 0, count: 100)
    arr.forEach { num in
        countingArr[num] += 1
    }
    return countingArr
}
