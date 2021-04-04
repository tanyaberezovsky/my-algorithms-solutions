import Foundation
//imutable array and its size
let myArray = [1,2,3]

var s="00000"//.reversed()
var lastIndexOfOne = -1
for i in (0..<s.count).reversed() {
   let char = s[s.index(s.startIndex, offsetBy: i)]
    if char == "1" {
       lastIndexOfOne = i
       break
    }
    //print(char)
}
print("index of last 1 = \(lastIndexOfOne)")

//
///*
// Arr[] = {4, 3, 7, 8, 6, 2, 1}
// Output: 3 7 4 8 2 6 1
// Explanation: 3 < 7 > 4 < 8 > 2 < 6 > 1
// */
func zigZag(arr1: [Int]) -> [Int] {
    var arr = arr1
    for i in 0..<arr.count - 1 {
        if i % 2 != 0 {//even <
            if arr[i] < arr[i+1] {
                arr.swapAt( i, i+1)
            }
        } else {//odd >
            if arr[i] > arr[i+1] {
                arr.swapAt(i, i+1)
            }
        }
    }
    return arr
}

import XCTest

class Tests: XCTestCase {
    func test01() {
        let arr = [1,2,3,4,5]
        let output = zigZag(arr1: arr)
        print(output)
         XCTAssertEqual(output, [1,3,2,5,4])
    }
}
Tests.defaultTestSuite.run()
