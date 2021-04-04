import Foundation

func calculateAWaterVoluem(arr:[Int]) -> Int {
    var leftIndex = 0, rightIndex = arr.count - 1, leftMax = 0, rightMax = 0
    var result = 0
    
    while leftIndex <= rightIndex {
        if arr[leftIndex] < arr[rightIndex] {
            if arr[leftIndex] > leftMax {
                leftMax = arr[leftIndex]
            } else {
                result = result + (leftMax - arr[leftIndex])
            }
            leftIndex += 1
        } else {
            if arr[rightIndex] > rightMax {
                rightMax = arr[rightIndex]
            } else {
                result = result + (rightMax - arr[rightIndex])
            }
            rightIndex -= 1
        }
    }
    return result
}

import XCTest
class Test: XCTestCase {
    func testDesendingArray() {
        let result = calculateAWaterVoluem(arr: [9, 8,0,5,0,2])
        print("result \(result)")
        let expected = 7
        XCTAssertEqual(result, expected)
    }
    func testAssendingArray() {
        let result = calculateAWaterVoluem(arr: [2,0,5,0,8,9])
        print("result \(result)")
        let expected = 7
        XCTAssertEqual(result, expected)
    }
    func testUnsortedArray() {
        let result = calculateAWaterVoluem(arr: [2,0,5,0,8,9,0,3])
        print("result \(result)")
        let expected = 10
        XCTAssertEqual(result, expected)
    }
}

Test.defaultTestSuite.run()
