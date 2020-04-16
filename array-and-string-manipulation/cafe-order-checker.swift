//
//  cafe-order-checker.swift
//  
//
//  Created by Tania on 07/01/2020.
//

import Foundation
func isFirstComeFirstServed(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {
    
    // check if we're serving orders first-come, first-served
    var takeOutOrdersIndex = 0
    var dineInOrdersIndex = 0
    var servedOrdersIndex = 0
    
    while (takeOutOrdersIndex < takeOutOrders.count || dineInOrdersIndex < dineInOrders.count) && servedOrdersIndex < servedOrders.count {
        if !checkElement(&takeOutOrdersIndex, &dineInOrdersIndex, servedOrders[servedOrdersIndex]) {
            return false
        }
        servedOrdersIndex += 1
    }
    if takeOutOrdersIndex == takeOutOrders.count && dineInOrdersIndex == dineInOrders.count && servedOrdersIndex == servedOrders.count {
        return true
    }
    return false
}



func checkElement(_ takeOutOrdersIndex:inout Int, _ dineInOrdersIndex: inout Int, _ takeOutValue: Int, _ dineInValue: Int, _ servedValue: Int) -> Bool {
    if takeOutValue == servedValue {
        takeOutOrdersIndex += 1
        return true
    }
    if dineInValue == servedValue {
        dineInOrdersIndex += 1
        return true
    }
    return false
}














// tests

import XCTest

class Tests: XCTestCase {
    
    func testBothRegistersHaveSameNumberOfOrders() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [1, 4, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 2, 3, 4, 5, 6]
        )
        XCTAssertTrue(result)
    }
    
    func testRegistersHaveDifferentLengths() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [1, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 2, 6, 3, 5]
        )
        XCTAssertFalse(result)
    }
    
    func testOneRegisterIsEmpty() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [],
            dineInOrders: [2, 3, 6],
            servedOrders: [2, 3, 6]
        )
        XCTAssertTrue(result)
    }
    
    func testServedOrdersIsMissingOrders() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [1, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 6, 3, 5]
        )
        XCTAssertFalse(result)
    }
    
    func testServedOrdersHasExtraOrders() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [1, 5],
            dineInOrders: [2, 3, 6],
            servedOrders: [1, 2, 3, 5, 6, 8]
        )
        XCTAssertFalse(result)
    }
    
    func testOneRegisterHasExtraOrders() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [1, 9],
            dineInOrders: [7, 8],
            servedOrders: [1, 7, 8]
        )
        XCTAssertFalse(result)
    }
    
    func testOneRegisterHasUnservedOrders() {
        let result = isFirstComeFirstServed(
            takeOutOrders: [55, 9],
            dineInOrders: [7, 8],
            servedOrders: [1, 7, 8, 9]
        )
        XCTAssertFalse(result)
    }
    
    static let allTests = [
        ("testBothRegistersHaveSameNumberOfOrders", testBothRegistersHaveSameNumberOfOrders),
        ("testRegistersHaveDifferentLengths", testRegistersHaveDifferentLengths),
        ("testOneRegisterIsEmpty", testOneRegisterIsEmpty),
        ("testServedOrdersIsMissingOrders", testServedOrdersIsMissingOrders),
        ("testServedOrdersHasExtraOrders", testServedOrdersHasExtraOrders),
        ("testOneRegisterHasExtraOrders", testOneRegisterHasExtraOrders),
        ("testOneRegisterHasUnservedOrders", testOneRegisterHasUnservedOrders)
    ]
}

//XCTMain([testCase(Tests.allTests)])
Tests.defaultTestSuite.run()
