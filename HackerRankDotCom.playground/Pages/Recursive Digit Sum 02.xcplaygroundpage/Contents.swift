//: [Previous](@previous)

import Foundation

func superDigit(n: String, k: Int) -> Int {
    var sum = 0
    
    n.forEach { char in
        if let num = char.wholeNumberValue {
            sum += num
        }
    }
    sum = sum * k
 
    if sum > 9 {
        return superDigit(n: "\(sum)", k: 1)
    } else {
        return sum
    }

}

superDigit(n: "9875", k: 4)

superDigit(n: "148", k: 3)
