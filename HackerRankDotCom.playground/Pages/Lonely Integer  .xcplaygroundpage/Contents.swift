//: [Previous](@previous)

import Foundation

func lonelyinteger(a: [Int]) -> Int {
    var aSet = Set<Int>()
    
    a.forEach { num in
        if aSet.contains(num) {
            aSet.remove(num)
        } else {
            aSet.insert(num)
        }
    }
    return (aSet.first ?? -1) as Int
}

lonelyinteger(a: [1, 2, 8, 8, 1])
var populatedDictionary = ["key1": "value1", "key2": "value2"]
populatedDictionary.keys
populatedDictionary.values

let emojiText: NSString = "?launcher"
print(emojiText.substring(with: NSRange(location: 0, length: 2)))

var a = [Int]()
a.insert(<#T##newElement: Int##Int#>, at: <#T##Int#>)
