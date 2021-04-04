import Foundation
//https://practice.geeksforgeeks.org/problems/chocolate-distribution-problem/0

func chocolateDist(arr: [Int], people: Int) -> Int {
    if people > arr.count { return 0 }

    var minDiff = Int.max
    let arr = arr.sorted()
    var end = people - 1
    var start = 0
    
    while end < arr.count {
        print("end \(arr[end]) - \(arr[start])")
        minDiff = min(minDiff, arr[end] - arr[start])
        start += 1
        end += 1
    }
    return minDiff
}

import XCTest

class Tests: XCTestCase {
    func testRegularArr01() {
        let arr = [1, 4, 3, 56, 12, 9, 9, 7]
        let people = 5
        let output = chocolateDist(arr: arr, people: people)
        XCTAssertEqual(output, 6)
    }
}

Tests.defaultTestSuite.run()

