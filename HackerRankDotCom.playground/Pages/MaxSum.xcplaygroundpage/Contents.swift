//: [Previous](@previous)

import Foundation

func miniMaxSum(arr: [Int]) -> Void {
    let min = arr.min() ?? 0
    let max = arr.max() ?? 0
  
    let sum = arr.reduce(0) { $0 + $1 }

    print("\(sum - max) \(sum - min)")
}

miniMaxSum(arr: [1,3,5,7,9])
