//https://practice.geeksforgeeks.org/problems/find-all-pairs-whose-sum-is-x/0
import Foundation

func findPairs(a: [Int], b: [Int], x: Int) {
    let bSet = Set(b)
    var output = [String]()
    
    for num in a {
        if bSet.contains(x - num) {
            output.append("\(num) \(x-num)")
        }
    }
    print(output.joined(separator: ", "))
}

findPairs(a: [1,2,3], b: [5,6,5,3,4,8], x: 9)
