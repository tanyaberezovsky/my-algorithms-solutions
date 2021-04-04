import Foundation
//https://practice.geeksforgeeks.org/problems/unsorted-array/0

func findElement(arr: [Int]) -> Int {
    let index = -1
    let leftMaxArr = creatLeftMaxArr(arr)
    var rightMin = arr[arr.count-1]
    for i in (0..<arr.count-1).reversed() {
        if leftMaxArr[i] > arr[i] && arr[i] < rightMin && leftMaxArr[i+1] == rightMin {
            return rightMin
        }
        rightMin = min(arr[i], rightMin)
    }
    return index
}

func creatLeftMaxArr(_ arr: [Int]) -> [Int] {
    var newArr = Array(repeating: 0, count: arr.count)
    newArr[0] = arr[0]
    for i in 1..<arr.count {
        newArr[i] = max(newArr[i-1], arr[i])
    }
    return newArr
}

import XCTest

class Tests: XCTestCase {
    func testRegularArr01() {
        let arr = [3, 2 ,4 ,6 ,9 ,8 ,7]
        let output = findElement(arr: arr)
        XCTAssertEqual(output, 4)
    }
    func testRegularArr02() {
        let arr = [4, 3, 2, 7, 8, 9]
        let output = findElement(arr: arr)
        XCTAssertEqual(output, 7)
    }
    func testNoMatch() {
        let arr = [3, 6, 4, 5, 9, 8, 7]
        let output = findElement(arr: arr)
        XCTAssertEqual(output, -1)
    }
}

Tests.defaultTestSuite.run()
