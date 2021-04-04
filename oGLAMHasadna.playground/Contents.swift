//: Playground - noun: a place where people can play

import UIKit
let digitToFind = 7

var dividedByDigit = false
var digitIncluded = false

for i  in 1...100{

    dividedByDigit = i % 7 == 0 ? true : false
    digitIncluded = ("\(i)".range(of: "\(digitToFind)") != nil) ? true : false
    print("\(i)")
    if (dividedByDigit && digitIncluded){
        print("openglam!")
    } else if (dividedByDigit) {
        print("boom!")
    } else if (digitIncluded) {
        print("bang!")
    }
}

