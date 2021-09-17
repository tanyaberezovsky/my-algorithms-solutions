//: [Previous](@previous)

import Foundation

func gridChallenge(grid: [String]) -> String {
    var prevArr: Array<Character>?
    
    for str in grid {
        
        let sorted = Array(str).sorted()
        if !isArraysAscending(prevArr, sorted) {
            print("\(sorted) prevArr \(prevArr)")
            return "NO"
        }
        prevArr = sorted
    }
    
    return "YES"
}

func isArraysAscending(_ first: Array<Character>?, _ second: Array<Character>) -> Bool {
    guard let first = first else {
        return true
    }
    for i in 0 ..< first.count {
        if first[i] < second[i] {
            return true
        }
       if first[i] > second[i] {
           return false
       }
    }
    return true
}
gridChallenge(grid: ["ebacd", "fghij", "olmkn", "trpqs", "xywuv"])
gridChallenge(grid: ["nflvjznh"])
gridChallenge(grid: ["eb","cd"])


print("\("ddd" < "ddp")")
