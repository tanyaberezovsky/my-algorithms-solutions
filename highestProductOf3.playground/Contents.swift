import UIKit

print("\(max(-2,-5))")
enum HighestProductError: Error, CustomStringConvertible {
    case lessThanThree
    
    var description: String {
        return "Less than 3 items!"
    }
}


func highestProductOf3(_ items: [Int]) throws -> Int {
    
    guard items.count >= 3 else {
        throw HighestProductError.lessThanThree
    }
    print(items)
    var max1 = items[0]
    var max2 = items[1]
    var max3 = items[2]
    var min1:Int = min(items[0], items[1])
    var min2:Int = items[2]
    var tmpMin:Int
    // calculate the highest product of three numbers  [-5, -1, -3, -2]
    for i in items[3...] {
        print("i \(i)")
        tmpMin = i
        min1 = min(tmpMin,max1)//-5
        max1 = max(tmpMin, max1)//-2
        print("max1 \(max1) min1 \(min1)")
        
        tmpMin = min1
        min2 = min(tmpMin,max2)
        max2 = max(tmpMin, max2)
        
        tmpMin = min2
      //  min1 = min(tmpMin,max3)
        max3 = max(tmpMin, max3)
    }
    print("max1 \(max1) max2 \(max2) max3 \(max3) = \(max1 * max2 * max3)")
    return max( max1 * max2 * max3, min1 * min2 * max(max3,max1, max2))
}

/*
 
 func highestProductOf3(_ items: [Int]) throws -> Int {
 
 guard items.count >= 3 else {
 throw HighestProductError.lessThanThree
 }
 print(items)
 var max1 = items[0]
 var max2 = items[1]
 var max3 = items[2]
 var min1:Int, tmpMin:Int
 // calculate the highest product of three numbers
 for i in items[3...] {
 print("i \(i)")
 tmpMin = i
 min1 = min(tmpMin,max1)//-5
 max1 = max(tmpMin, max1)//-2
 print("max1 \(max1) min1 \(min1)")
 
 tmpMin = min1
 min1 = min(tmpMin,max2)
 max2 = max(tmpMin, max2)
 
 tmpMin = min1
 min1 = min(tmpMin,max3)
 max3 = max(tmpMin, max3)
 }
 print("max1 \(max1) max2 \(max2) max3 \(max3) = \(max1 * max2 * max3)")
 return max1 * max2 * max3
 }
 

 */





// tests

import XCTest

class Tests: XCTestCase {
    
    func testShortArray() {
        let actual = try? highestProductOf3([1, 2, 3, 4])
        let expected = 24
        XCTAssertEqual(actual, expected)
    }
    
    func testLongerArray() {
        let actual = try? highestProductOf3([6, 1, 3, 5, 7, 8, 2])
        let expected = 336
        XCTAssertEqual(actual, expected)
    }
    
    func testArrayHasOneNegative() {
        let actual = try? highestProductOf3([-5, 4, 8, 2, 3])
        let expected = 96
        XCTAssertEqual(actual, expected)
    }
    
    func testArrayHasTwoNegatives() {
        let actual = try? highestProductOf3([-10, 1, 3, 2, -10])
        let expected = 300
        XCTAssertEqual(actual, expected)
    }
    
    func testArrayIsAllNegatives() {
        let actual = try? highestProductOf3([-5, -1, -3, -2])
        let expected = -6
        XCTAssertEqual(actual, expected)
    }
    
    func testErrorWithEmptyArray() {
        let actual = try? highestProductOf3([])
        let expected: Int? = nil
        XCTAssertEqual(actual, expected)
    }
    
    func testErrorWithOneNumber() {
        let actual = try? highestProductOf3([1])
        let expected: Int? = nil
        XCTAssertEqual(actual, expected)
    }
    
    func testErrorWithTwoNumbers() {
        let actual = try? highestProductOf3([1, 1])
        let expected: Int? = nil
        XCTAssertEqual(actual, expected)
    }
    
    static let allTests = [
        ("testShortArray", testShortArray),
        ("testLongerArray", testLongerArray),
        ("testArrayHasOneNegative", testArrayHasOneNegative),
        ("testArrayHasTwoNegatives", testArrayHasTwoNegatives),
        ("testArrayIsAllNegatives", testArrayIsAllNegatives),
        ("testErrorWithEmptyArray", testErrorWithEmptyArray),
        ("testErrorWithOneNumber", testErrorWithOneNumber),
        ("testErrorWithTwoNumbers", testErrorWithTwoNumbers)
    ]
}

//XCTFail([XCTestCase(Tests.allTests)])
Tests.defaultTestSuite.run()
