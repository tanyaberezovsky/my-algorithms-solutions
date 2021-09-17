//: [Previous](@previous)

import Foundation

func miniMaxSum(arr: [Int]) -> Void {
    
    var sum = 0
    let arrSorted = arr.sorted()
    
    arrSorted.forEach { num in
        sum = sum + num
    }

    print("\(sum - arrSorted[4]) \(sum - arrSorted[0])")
}

miniMaxSum(arr: [1,3,5,7,9])
