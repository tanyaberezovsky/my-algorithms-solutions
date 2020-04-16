import UIKit


func getMaxProfit(from stockPrices: [Int]) -> Int{
    var maxProfit = 0
    var bigestProfitIndex:Int = 0
    
    for i in 1 ..< stockPrices.count {
        print("i = \(i)")
        print("stockPrices[i] = \(stockPrices[i])")
        
        if i == 1 {
            maxProfit = stockPrices[i] - stockPrices[0]
            bigestProfitIndex = i
        } else {
            if maxProfit < stockPrices[i] - stockPrices[0] {
                maxProfit =  stockPrices[i] - stockPrices[0]
                bigestProfitIndex = i
            }
        }
        print("maxProfit = \(maxProfit)")
        
    }
    var smallestProfitIndex:Int = 0
    var smallestValueStock = stockPrices[bigestProfitIndex]
    for i in 0 ..< bigestProfitIndex {
        if stockPrices[i] <= smallestValueStock {
            smallestValueStock = stockPrices[i]
            smallestProfitIndex = i
        }
    }
    maxProfit = stockPrices[bigestProfitIndex] - stockPrices[smallestProfitIndex]
    return maxProfit
}

let stockPrices = [10, 7, 5, 8, 11, 9]
//7 - 10 = -3
// 5 - 10 = -5
// 8-10 = -2
// 11 - 10 = 1 index 5 is the biggest
// 9 - 10 = -1

//[10, 8, 3, 1]
//8 - 10 = -2 index 1 in the biggest
// 3 - 10 = -7
//1 - 10 = -9
let maxProfit = getMaxProfit(from: stockPrices)
