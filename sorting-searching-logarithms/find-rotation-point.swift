//
//  find-rotation-point.swift
//  
//
//  Created by Tania on 11/02/2020.
//

import Foundation
func findRotationPoint(in words1: [String]) -> Int {
    
    // find the rotation point in the array
    var floor = -1
    var celling = words1.count
    
    return -1
}


















// tests

import XCTest

class Tests: XCTestCase {
    
    func testSmallArray() {
        let actual = findRotationPoint(in: ["cape", "cake"])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testMediumArray() {
        let actual = findRotationPoint(in: ["grape", "orange",
                                            "plum", "radish", "apple"])
        let expected = 4
        XCTAssertEqual(actual, expected)
    }
    
    func testLargeArray() {
        let actual = findRotationPoint(in: ["ptolemaic", "retrograde", "supplant",
                                            "undulate", "xenoepist", "asymptote",
                                            "babka", "banoffee", "engender",
                                            "karpatka", "othellolagkage"])
        let expected = 5
        XCTAssertEqual(actual, expected)
    }
    
    // are we missing any edge cases?
    
    static let allTests = [
        ("testSmallArray", testSmallArray),
        ("testMediumArray", testMediumArray),
        ("testLargeArray", testLargeArray)
    ]
}

XCTMain([testCase(Tests.allTests)])
