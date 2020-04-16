import Foundation

func changePossibilities(amount: Int, denominations: [Int]) -> Int {
    return changePossibilitiesTopDown(amountLeft: amount, denominations: denominations, currentIndex: 0)
}

func changePossibilitiesTopDown(amountLeft: Int, denominations: [Int], currentIndex: Int) -> Int {
    
    // base cases:
    // we hit the amount spot on. yes!
    if amountLeft == 0 {
        return 1
    }
    
    // we overshot the amount left (used too many coins)
    if amountLeft < 0 {
        return 0
    }
    print("currentIndex \(currentIndex)")
    // we're out of denominations
    if currentIndex == denominations.count {
        return 0
    }
    
    print("checking ways to make \(amountLeft) with \(denominations[currentIndex..<denominations.count])")
    
    // choose a current coin
    let currentCoin = denominations[currentIndex]
    
    // see how many possibilities we can get
    // for each number of times to use currentCoin
    var numPossibilities = 0
    var amountLeftInner = amountLeft
    while amountLeftInner >= 0 {
        numPossibilities += changePossibilitiesTopDown(amountLeft: amountLeftInner, denominations: denominations,
                                                       currentIndex: currentIndex + 1)
        print("numPossibitities \(numPossibilities) currentCoin \(currentCoin) amountLeftInnerOld \(amountLeftInner) amountLeftInnerNew \(amountLeftInner - currentCoin)")
        amountLeftInner -= currentCoin
    }
    
    return numPossibilities
}

/*
func changePossibilities(amount: Int, denominations: [Int]) -> Int {
    
    // calculate the number of ways to make change
    
    
    return 0
}
*/




/*
func numberOfWays(amount: Int, denominations: [Int]) {
    var answer = 0
    for  denomination in denominations  {
        for numTimesToUseDenomination in possibleNumTimesToUseDenominationWithoutOvershootingAmount {
            answer += numberOfWays(amountRemaining, otherDenominations)
        }
    }
    return answer
}

(amount: 4, denominations: [1, 2, 3])
1

 
 4, [1,2,3]
 5, [7,3]
 0, [1]
 1, []
*/







// tests

import XCTest

class Tests: XCTestCase {
    
    func testSampleInput() {
        let actual = changePossibilities(amount: 4, denominations: [1, 2, 3])
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
