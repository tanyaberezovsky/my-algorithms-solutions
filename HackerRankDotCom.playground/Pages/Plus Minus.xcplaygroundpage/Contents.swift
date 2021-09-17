//: [Previous](@previous)

import Foundation


func plusMinus(arr: [Int]) -> Void {
    var positive = 0, negative = 0, zero = 0
    arr.forEach { num in
        if num == 0 {
            zero += 1
        } else if num > 0 {
            positive += 1
        } else {
            negative += 1
        }
    }
    
    let arrLength = arr.count
    printNumber(positive, arrLength)
    printNumber(negative, arrLength)
    printNumber(zero, arrLength)
}

func printNumber(_ numCount: Int, _ arrLength: Int) {
    print(String(format: "%.6f", numCount == 0 ? 0: Double(numCount) / Double(arrLength)))
}

plusMinus(arr: [1,2,3,4,5])
