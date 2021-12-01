//: [Previous](@previous)

import Foundation

func gridChallenge(grid: [String]) -> String {
    var prevArr = Array<Character>()
    
    for str in grid {
        
        let sorted = Array(str).sorted()
        print(" prevArr \(prevArr); sorted \(sorted)")
      
        if isArraysAscending(prevArr, sorted) == false {
            print("\(sorted) prevArr \(prevArr)")
            return "NO"
        }
        prevArr = sorted
    }
    
    return "YES"
}

func isArraysAscending(_ first: Array<Character>, _ second: Array<Character>) -> Bool {
    guard first.count > 0 else {
        return true
    }
    for i in 0 ..< first.count {
        print(" first[i] \(first[i]), second[i] \(second[i] ), first[i] > second[i] \(first[i] > second[i])")
       if first[i] > second[i] {
           return false
       }
    }
    return true
}
gridChallenge(grid: ["mpxz", "abcd", "wlmf"])
gridChallenge(grid: ["ebacd", "fghij", "olmkn", "trpqs", "xywuv"])
gridChallenge(grid: ["nflvjznh"])
gridChallenge(grid: ["eb","cd"])
//
//
//print("\("ddd" < "ddp")")
