//: [Previous](@previous)

import Foundation

func diagonalDifference(arr: [[Int]]) -> Int {

    var rightSum = 0
    var leftSum = 0
    for i in 0 ..< arr.count {
        rightSum = rightSum + arr[i][i]
        leftSum = leftSum + arr[i][arr.count - 1 - i]
    }
    print(rightSum)
    print(leftSum)
    print(rightSum - leftSum)
    return abs(rightSum - leftSum)
}

diagonalDifference(arr: [[11, 2, 4], [4, 5, 6], [10, 8, -12]])




