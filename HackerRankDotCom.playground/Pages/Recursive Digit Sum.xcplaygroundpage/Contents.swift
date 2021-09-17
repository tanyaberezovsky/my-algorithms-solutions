//: [Previous](@previous)

import Foundation

func superDigit(n: String, k: Int) -> Int {
    var sum = 0
    n.forEach { chr in
        if let num = chr.wholeNumberValue {
            sum = sum + num
        }
    }
    sum = sum * k
    if sum > 9 {
        return superDigit(n: "\(sum)", k: 1)
    } else {
        return sum
    }
}
superDigit(n: " 9875", k: 4)

