import Foundation
//https://practice.geeksforgeeks.org/problems/largest-number-formed-from-an-array1117/1
//Largest Number formed from an Array

func printLargestNum(arr:[Int]) {
    var arr = arr
    let s = arr.sorted {
         compare($0, $1)
    }
    let a = s.reduce("", { $0 + "\($1)" })
    print(a)
//    print(a.joined())
//    print(s)
    func compare(_ a: Int, _ b: Int) -> Bool {
        if "\(a)\(b)" > "\(b)\(a)" {
            return true
        }
        return false
    }
}


printLargestNum(arr: [3,30,34,5,9])
//
func printReversedString(s:String) {
    //for\
    var arr = s.split(separator: ".")
    var newS=arr[arr.count-1]
    for i in (0 ..< arr.count-1).reversed() {
        newS = newS + "." + arr[i]
    }
    print(newS)
    print(s.split(separator: ".").reversed())
//    s.insert(<#T##newElement: Character##Character#>, at: <#T##String.Index#>)
}
func printReversedString2(s:String) {
    var world = ""
    for char in s {
        if char != "." {
            world = world + "\(char)"
        }
    }


}
printReversedString(s: "I.like.my.company.very.much")

let numbers = [100, 5, 53, 98, 29]
let reversed1 = Array(numbers.reversed())
print(reversed1)

let arr = "I.like.my.company.very.much".split(separator: ".")
let reversed2 = Array(arr.reversed())
print(reversed2.joined(separator: "."))
