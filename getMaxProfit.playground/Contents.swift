import UIKit

func getMaxProfit(from stockPricesYesterday: [Int]) -> Int? {
    guard stockPricesYesterday.count > 1 else {
        return nil
    }
    var maxProfit: Int = stockPricesYesterday[1] - stockPricesYesterday[0] //4
    var lowestPrice: Int = stockPricesYesterday[0] //1
    
    for price in stockPricesYesterday[1...] {
        maxProfit = max(maxProfit, price - lowestPrice) // 4, 4
        lowestPrice = min(price, lowestPrice)
    }
    return maxProfit
}
















// tests

import XCTest

class Tests: XCTestCase {
    
    func testPriceGoesUpThenDown() {
        let actual = getMaxProfit(from: [1, 5, 3, 2])
        let expected = 4
        XCTAssertEqual(actual, expected)
    }
    
    func testPriceGoesDownThenUp() {
        let actual = getMaxProfit(from: [7, 2, 8, 9])
        let expected = 7
        XCTAssertEqual(actual, expected)
    }
    
    func testPriceGoesUpAllDay() {
        let actual = getMaxProfit(from: [1, 6, 7, 9])
        let expected = 8
        XCTAssertEqual(actual, expected)
    }
    
    func testPriceGoesDownAllDay() {
        let actual = getMaxProfit(from: [9, 7, 4, 1])
        let expected = -2
        XCTAssertEqual(actual, expected)
    }
    
    func testPriceStaysTheSameAllDay() {
        let actual = getMaxProfit(from: [1, 1, 1, 1])
        let expected = 0
        XCTAssertEqual(actual, expected)
    }
    
    func testReturnNilWithEmptyPrices() {
        let actual = getMaxProfit(from: [])
        XCTAssertNil(actual)
    }
    
    func testReturnNillWithOnePrice() {
        let actual = getMaxProfit(from: [1])
        XCTAssertNil(actual)
    }
    
    static let allTests = [
        ("testPriceGoesUpThenDown", testPriceGoesUpThenDown),
        ("testPriceGoesDownThenUp", testPriceGoesDownThenUp),
        ("testPriceGoesUpAllDay", testPriceGoesUpAllDay),
        ("testPriceGoesDownAllDay", testPriceGoesDownAllDay),
        ("testPriceStaysTheSameAllDay", testPriceStaysTheSameAllDay),
        ("testReturnNilWithEmptyPrices", testReturnNilWithEmptyPrices),
        ("testReturnNillWithOnePrice", testReturnNillWithOnePrice)
    ]
}

XCTMain([testCase(Tests.allTests)])
