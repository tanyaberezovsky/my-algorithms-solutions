//https://practice.geeksforgeeks.org/problems/maximum-index/0

import Foundation

func maximumIndex(a:[Int]) -> Int {
    var maxIndex: Int = -1
    
    for i in 0 ..< a.count - 1 {
        for j in (1 ..< a.count).reversed() {
            if (j-i) <= maxIndex || i < j {
                break;
            }
         
            if a[i] <= a[j] {
                print("a[i] <= a[j] \(a[i]) \(a[j])")
                maxIndex = max(maxIndex, j-i)
            }
        }
    }
    return maxIndex
}

//print(maximumIndex(a: [34, 8, 10, 3, 2, 80, 30, 33, 1]))
//print(maximumIndex(a: [9, 2, 3, 4, 5, 6, 7, 8, 18, 0]))
//print(maximumIndex(a: [1, 2, 3, 4, 5, 6]))

print(maximumIndex(a: [6, 5, 4, 3, 2, 1]))
