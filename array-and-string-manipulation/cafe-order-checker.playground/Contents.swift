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
    var servedValue: Int
    var takeOutOrders = takeOutOrders
    var dineInOrders = dineInOrders
    
    while (takeOutOrdersIndex < takeOutOrders.count || dineInOrdersIndex < dineInOrders.count) && servedOrdersIndex < servedOrders.count {
        servedValue = servedOrders[servedOrdersIndex]
        if !checkElement(&takeOutOrdersIndex, &takeOutOrders, servedValue) && !checkElement(&dineInOrdersIndex, &dineInOrders, servedValue) {
            return false
        }
        servedOrdersIndex += 1
    }
    if takeOutOrdersIndex == takeOutOrders.count && dineInOrdersIndex == dineInOrders.count && servedOrdersIndex == servedOrders.count {
        return true
    }
    return false
}



func checkElement(_ index: inout Int, _ orders: inout [Int], _ servedValue: Int) -> Bool {
    guard index < orders.count else { return false}
    
    if orders[index] == servedValue {
        index += 1
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
