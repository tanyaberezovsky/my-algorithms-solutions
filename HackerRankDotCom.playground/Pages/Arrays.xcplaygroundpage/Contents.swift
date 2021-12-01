//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

let nums = [1 , 5, 6]

//MARK: - Map
let numsDouble = nums.map { $0 * 2 }
print(numsDouble)

//MARK: compactMap
/* The compactMap() method lets us transform the elements of an array just like map() does, except once the transformation completes an extra step happens: all optionals get unwrapped, and any nil values get discarded. */
let numbers = ["1", "2", "Fish"]
let integers = numbers.compactMap { Int($0) }
print(integers)

let evenSum = Array(1...10)//Cannot convert value of type 'ClosedRange<Int>'
    .filter { (number) in number % 2 == 0 }
    .reduce(0) { (total, number) in total + number }

print(evenSum)
