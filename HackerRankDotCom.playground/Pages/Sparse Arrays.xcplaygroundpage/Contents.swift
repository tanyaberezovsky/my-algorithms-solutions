//: [Previous](@previous)

import Foundation

func matchingStrings(strings: [String], queries: [String]) -> [Int] {
    var output = [Int]()
    var dictionary = [String: Int]()
    
    strings.forEach { element in
        if let value = dictionary[element] {
            dictionary[element] = value + 1
        } else {
            dictionary[element] = 1
        }
    }
    
    queries.forEach { elem in
        output.append(dictionary[elem] != nil ? dictionary[elem]! : 0)
    }
    return output
}


matchingStrings(strings: ["ab", "ab", "abc"], queries: ["ab", "abc", "bc"])
