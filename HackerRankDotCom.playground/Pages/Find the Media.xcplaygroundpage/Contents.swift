//: [Previous](@previous)

import Foundation

func findMedian(arr: [Int]) -> Int {
    var arr = arr.sorted()
    return arr[arr.count / 2 ]
}
