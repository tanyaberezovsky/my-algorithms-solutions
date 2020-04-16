import Foundation

func findRepeat(in numbers: [Int]) -> Int {
    var dict:[Int:Int] = [Int:Int]()
    var number: Int
    // find a number that appears more than once
    for i in 0 ..< numbers.count {
        print(i)
        number = numbers[i]
        if let _ = dict[number] {
            return number
        } else {
            dict[number] = 1
        }
        
    }

    return 0
}


















// tests

import XCTest

class Tests: XCTestCase {

    func testJustTheRepeatedNumber() {
        let numbers = [1, 1]
        let actual = findRepeat(in: numbers)
        let expected = 1
        XCTAssertEqual(actual, expected)
    }

    func testShortArray() {
        let numbers = [1, 2, 3, 2]
        let actual = findRepeat(in: numbers)
        let expected = 2
        XCTAssertEqual(actual, expected)
    }

    func testMediumArray() {
        let numbers = [1, 2, 5, 5, 5, 5]
        let actual = findRepeat(in: numbers)
        let expected = 5
        XCTAssertEqual(actual, expected)
    }

    func testLongArray() {
        let numbers = [4, 1, 4, 8, 3, 2, 7, 6, 5]
        let actual = findRepeat(in: numbers)
        let expected = 4
        XCTAssertEqual(actual, expected)
    }

    static let allTests = [
        ("testJustTheRepeatedNumber", testJustTheRepeatedNumber),
        ("testShortArray", testShortArray),
        ("testMediumArray", testMediumArray),
        ("testLongArray", testLongArray)
    ]
}

Tests.defaultTestSuite.run()
