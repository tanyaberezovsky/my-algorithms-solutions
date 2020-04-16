import Foundation

func getProductsOfAllIntsExceptAtIndex(_ ints: [Int]) -> [Int]? {
    var allInts: [Int] = [Int]()
    var prevNum: Int = ints[0]
    
    print(ints)
    
    allInts.append(1)
    
    // make an array with the products
    for num in ints[1..<ints.count] {
        print(num)
        allInts.append(prevNum)
        prevNum = prevNum * num
    }
    prevNum = ints[ints.count - 1]
    for i in (0..<ints.count-2).reversed() {
        print(i)
        //allInts[]
    }
    print("allInts \(allInts)")
    return nil
}


// tests
import XCTest

class Tests: XCTestCase {
    
    func testSmallArray() {
        let actual = getProductsOfAllIntsExceptAtIndex([1, 2, 3])
        let expected = [6, 3, 2]
        assertArraysEqual(actual, expected)
    }
    
    func testLongerArray() {
        let actual = getProductsOfAllIntsExceptAtIndex([8, 2, 4, 3, 1, 5])
        let expected = [120, 480, 240, 320, 960, 192]
        assertArraysEqual(actual, expected)
    }
    
    func testArrayHasOneZero() {
        let actual = getProductsOfAllIntsExceptAtIndex([6, 2, 0, 3])
        let expected = [0, 0, 36, 0]
        assertArraysEqual(actual, expected)
    }
    
    func testArrayHasTwoZeros() {
        let actual = getProductsOfAllIntsExceptAtIndex([4, 0, 9, 1, 0])
        let expected = [0, 0, 0, 0, 0]
        assertArraysEqual(actual, expected)
    }
    
    func testOneNegativeNumber() {
        let actual = getProductsOfAllIntsExceptAtIndex([-3, 8, 4])
        let expected = [32, -12, -24]
        assertArraysEqual(actual, expected)
    }
    
    func testAllNegativeNumbers() {
        let actual = getProductsOfAllIntsExceptAtIndex([-7, -1, -4, -2])
        let expected = [-8, -56, -14, -28]
        assertArraysEqual(actual, expected)
    }
    
    func testErrorWithEmptyArray() {
        let actual = getProductsOfAllIntsExceptAtIndex([])
        XCTAssertNil(actual)
    }
    
    func testErrorWithOneNumber() {
        let actual = getProductsOfAllIntsExceptAtIndex([1])
        XCTAssertNil(actual)
    }
    
    static let allTests = [
        ("testSmallArray", testSmallArray),
        ("testLongerArray", testLongerArray),
        ("testArrayHasOneZero", testArrayHasOneZero),
        ("testArrayHasTwoZeros", testArrayHasTwoZeros),
        ("testOneNegativeNumber", testOneNegativeNumber),
        ("testAllNegativeNumbers", testAllNegativeNumbers),
        ("testErrorWithEmptyArray", testErrorWithEmptyArray),
        ("testErrorWithOneNumber", testErrorWithOneNumber)
    ]
}

func assertArraysEqual(_ actual: [Int]?, _ expected: [Int]) {
    if let actual = actual {
        XCTAssertEqual(actual, expected)
    } else {
        XCTFail("actual is nil")
    }
}
Tests.defaultTestSuite.run()

//XCTMain([testCase(Tests.allTests)])
