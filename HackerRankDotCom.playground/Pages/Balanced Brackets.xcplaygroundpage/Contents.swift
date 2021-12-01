//: [Previous](@previous)

import Foundation

let difference      = 1
let array           = [1,2,4,6,7,10,12,13]
var differenceArray = [Int]()

for index in stride(from: 1, to: array.count, by: 2) {
    let difference  = array[index]-array[index-1]
    differenceArray.append(difference)
}

print(differenceArray.filter{ $0 == difference }.count)



func isBalanced(s: String) -> String {
    var stuck = [Character]()//LIFO

    
    
    for char in s {
        if isRight(char) {
            stuck.append(char)
        } else {
            guard let last = stuck.popLast(), isPair(last, char) else {
                return "NO"
            }

        }
    }

    if stuck.count > 0 {
        return "NO"
    }
    return "YES"
}

func isRight(_ c: Character) -> Bool {
    if c == "{" || c == "(" || c == "[" {
        return true
    }
    return false
}


func isPair(_ r: Character, _ l: Character) -> Bool {
    if r == "{" && l == "}" {
        return true
    }
    if r == "(" && l == ")" {
        return true
    }
    if r == "[" && l == "]" {
        return true
    }
    return false
}

//isBalanced(s:"{()}")
//isBalanced(s:"{(()}")
isBalanced(s: "{[(])}")
