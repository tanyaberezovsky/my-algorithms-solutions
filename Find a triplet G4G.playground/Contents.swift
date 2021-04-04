//https://www.geeksforgeeks.org/find-triplet-sum-two-equals-third-element/
import Foundation

func findTriplet(a:[Int]) -> Int {
    var triplets = 0
    var j=0
    var a = a
    let setA = Set(a)
    var possibleSum = 0
    var complimentaryNum = 0
    a.sort()
    print(setA)
    for i in (0 ..< a.count).reversed() {
        possibleSum = a[i]
        j = 0
        print("i=\(i) possibleSum \(possibleSum) middleNum(num: a[i])  = \(middleNum(num: a[i]) )")

        while (j<i && middleNum(num: a[i]) > a[j]) {
            print("possibleSum \(possibleSum) middleNum(num: a[i])  = \(middleNum(num: a[i]) )")
            complimentaryNum = possibleSum - a[j]
            if setA.contains(complimentaryNum) {
                triplets = triplets + 1
            }
          j = j + 1
        }
        
    }
    if triplets == 0 {
        return -1
    }
    return triplets
}

func middleNum(num:Int) -> Int {
    if (num % 2 == 0) {
        return num / 2
    }
    return (num / 2) + 1
}


import XCTest

class Tests: XCTestCase {
    func testArrayOf5() {
        let a = [1,5,3,2]
        let expectedOutput = 2
        let ret = findTriplet(a: a)
        print("ret = \(ret)")
        XCTAssertEqual(expectedOutput, ret)
    }
    
    func testNoTriples() {
        
        let a = [1,5,3]
        let expectedOutput = -1
        let ret = findTriplet(a: a)
        print("ret = \(ret)")
        XCTAssertEqual(expectedOutput, ret)
    }
}


Tests.defaultTestSuite.run()

