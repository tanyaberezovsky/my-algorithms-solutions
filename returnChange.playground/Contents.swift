import Foundation

func maxChangePossibilitie(amount: Int, denominations: [Int]) -> Int {
    
    
    
    return 0
    
}





// tests

import XCTest

class Tests: XCTestCase {
    
    func testSampleInput() {
        let actual = maxChangePossibilitie(amount: 4, denominations: [3, 2, 1])
        let expected = 4
        XCTAssertEqual(actual, expected)
    }
    //
    //    func testOneWayToMakeZeroCents() {
    //        let actual = changePossibilities(amount: 0, denominations: [1, 2])
    //        let expected = 1
    //        XCTAssertEqual(actual, expected)
    //    }
    //
    //    func testNoWaysIfNoCoins() {
    //        let actual = changePossibilities(amount: 1, denominations: [])
    //        let expected = 0
    //        XCTAssertEqual(actual, expected)
    //    }
    //
    //    func testBigCoinValue() {
    //        let actual = changePossibilities(amount: 5, denominations: [25, 50])
    //        let expected = 0
    //        XCTAssertEqual(actual, expected)
    //    }
    //
    //    func testBigTargetAmount() {
    //        let actual = changePossibilities(amount: 50, denominations: [5, 10])
    //        let expected = 6
    //        XCTAssertEqual(actual, expected)
    //    }
    //
    //    func testChangeForOneDollar() {
    //        let actual = changePossibilities(amount: 100, denominations: [1, 5, 10, 25, 50])
    //        let expected = 292
    //        XCTAssertEqual(actual, expected)
    //    }
    
    static let allTests = [
        ("testSampleInput", testSampleInput),
        //        ("testOneWayToMakeZeroCents", testOneWayToMakeZeroCents),
        //        ("testNoWaysIfNoCoins", testNoWaysIfNoCoins),
        //        ("testBigCoinValue", testBigCoinValue),
        //        ("testBigTargetAmount", testBigTargetAmount),
        //        ("testChangeForOneDollar", testChangeForOneDollar)
    ]
}
Tests.defaultTestSuite.run()
//XCTMain([testCase(Tests.allTests)])
