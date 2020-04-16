import Foundation

func mergeArrays(_ myArray: [Int], _ alicesArray: [Int]) -> [Int] {
    
    // combine the sorted arrays into one large sorted array
    var mergedArray: [Int] = Array(repeating: 0, count: myArray.count + alicesArray.count)
    var headMyArray = 0, headAlicesArray = 0
    var k = 0
    while k < mergedArray.count {
        fillMergedArray(myArray, alicesArray, &mergedArray, &headMyArray, &headAlicesArray, &k)
        k += 1
    }
    return mergedArray
}

func fillMergedArray(_ myArray: [Int], _ alicesArray: [Int], _ mergedArray: inout [Int], _ i: inout Int, _ j: inout Int, _ k: inout Int) {
    guard i < myArray.count else {
        mergedArray[k] = alicesArray[j]
        j += 1
        return
    }
    guard j < alicesArray.count else {
        mergedArray[k] = myArray[i]
        i += 1
        return
    }
    if myArray[i] < alicesArray[j] {
        mergedArray[k] = myArray[i]
        i += 1
    } else {
        mergedArray[k] = alicesArray[j]
        j += 1
    }
}

/*
 let myArray = [3, 4, 6, 10, 11, 15]
 let alicesArray = [1, 5, 8, 12, 14, 19]
 
 */














// tests

import XCTest

class Tests: XCTestCase {
    
    func testBothArraysAreEmpty() {
        let myArray: [Int] = []
        let alicesArray: [Int] = []
        let actual = mergeArrays(myArray, alicesArray)
        let expected: [Int] = []
        XCTAssertEqual(actual, expected)
    }
    
    func testFirstArrayIsEmpty() {
        let myArray: [Int] = []
        let alicesArray = [1, 2, 3]
        let actual = mergeArrays(myArray, alicesArray)
        let expected = [1, 2, 3]
        XCTAssertEqual(actual, expected)
    }
    
    func testSecondArrayIsEmpty() {
        let myArray = [5, 6, 7]
        let alicesArray: [Int] = []
        let actual = mergeArrays(myArray, alicesArray)
        let expected = [5, 6, 7]
        XCTAssertEqual(actual, expected)
    }
    
    func testBothArraysHaveSomeNumbers() {
        let myArray = [2, 4, 6]
        let alicesArray = [1, 3, 7]
        let actual = mergeArrays(myArray, alicesArray)
        let expected = [1, 2, 3, 4, 6, 7]
        XCTAssertEqual(actual, expected)
    }
    
    func testArraysAreDifferentLengths() {
        let myArray = [2, 4, 6, 8]
        let alicesArray = [1, 7]
        let actual = mergeArrays(myArray, alicesArray)
        let expected = [1, 2, 4, 6, 7, 8]
        XCTAssertEqual(actual, expected)
    }
    
    static let allTests = [
        ("testBothArraysAreEmpty", testBothArraysAreEmpty),
        ("testFirstArrayIsEmpty", testFirstArrayIsEmpty),
        ("testSecondArrayIsEmpty", testSecondArrayIsEmpty),
        ("testBothArraysHaveSomeNumbers", testBothArraysHaveSomeNumbers),
        ("testArraysAreDifferentLengths", testArraysAreDifferentLengths)
    ]
}

//XCTMain([testCase(Tests.allTests)])
Tests.defaultTestSuite.run()
