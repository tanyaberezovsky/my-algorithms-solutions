import Foundation
//https://practice.geeksforgeeks.org/problems/stock-buy-and-sell/0

var buySellArr = [Int]()
func stockBuyAndSell(arr: [Int]) -> [Int] {
    //if arr.count < 2 { return "" }
    var buyIndex = 0
    var sellIndex = 0
    var i = 0
    while i + 1 < arr.count {
        if increacing(arr[i], arr[i+1]) {
           sellIndex = i+1
        } else {
            addToOutputArray(buyIndex, sellIndex)
            buyIndex = i+1
        }
        i += 1
    }
    addToOutputArray(buyIndex, sellIndex)
    return buySellArr
}

func increacing(_ num1:Int, _ num2: Int) -> Bool {
    return num1 < num2
}

func addToOutputArray(_ buyIndex: Int, _ sellIndex: Int) {
    if arr[buyIndex] < arr[sellIndex] { return }
    buySellArr.append(buyIndex)
    buySellArr.append(sellIndex)
}

import XCTest

class Tests: XCTestCase {
    func testRegularArr01() {
        let arr = [1, 4, 3, 56, 12, 9, 9, 7]
        let output = stockBuyAndSell(arr: arr)
        XCTAssertEqual(output, [1,4,3,56])
    }
}

Tests.defaultTestSuite.run()
