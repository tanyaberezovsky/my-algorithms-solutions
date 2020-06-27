import Foundation
/*
 
 Input:
 [0, 0, 0, 0, 1]
 [0, 0, 0, 1, 1]
 [0, 1, 1, 1, 1]
 [1, 1, 1, 1, 1]
 [1, 1, 1, 1, 1]

 int countZeroes(int A[MAX][MAX],int N)
 {
 //Your code here
 }

 */


func countZeroes(a: [[Int]], n: Int) -> Int {
    var maxZeroIndexRows = n
    var maxZeroIndexColumns = n
    var zeroCoumt = 0
    for irow in 0..<maxZeroIndexRows {
        for icolumn in 0..<maxZeroIndexColumns {
            if a[irow][icolumn] == 1 {
                maxZeroIndexRows = irow
                maxZeroIndexColumns = icolumn
            } else {
                zeroCoumt += 1
            }
        }
    }
    
    
    return zeroCoumt
}

import XCTest

class Tests: XCTestCase {
    func testPartlyMatrix() {

        let array2D: [[Int]] = [[0, 0, 0, 0, 1],
        [0, 0, 0, 1, 1],
        [0, 1, 1, 1, 1],
        [1, 1, 1, 1, 1],
        [1, 1, 1, 1, 1]]

        let result = countZeroes(a: array2D, n: 5)
        XCTAssertTrue(result == 8 ? true : false)

    }
    
    func testAllZerosMatrix() {

           let array2D: [[Int]] = [[0, 0],
           [0, 0]]

           let result = countZeroes(a: array2D, n: 2)
           XCTAssertTrue(result == 4 ? true : false)

       }
       func testAllOnesMatrix() {

               let array2D: [[Int]] = [[1,1],
               [1,1]]

               let result = countZeroes(a: array2D, n: 2)
               XCTAssertTrue(result == 0 ? true : false)

           }
         
}

Tests.defaultTestSuite.run()
