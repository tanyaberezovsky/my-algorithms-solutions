//https://practice.geeksforgeeks.org/problems/frequency-game/1
/*
 Pola Gershon11:20 AM
 void Main()
 {
     var arr = new[]{11,2,50,51,51,50,4};
     var dic = arr
         .GroupBy(r=>r)
         .ToDictionary(r=>r.Key, r=>r.Count());
     var min = dic.Values.Min();
     var res = dic
         .Where(r=>r.Value == min)
         .Select(r=>r.Key)
         .Max();
 }

 */
import Foundation


func maxNumLowFrequency(a:[Int]) -> Int {
    var maxNumLowFreq = 0
    var currentNum: Int = Int.min
    var lowFrequencyNums = [Int: [Int]]()
    var minFrequency = Int.max
    var currentFrequency = 0
    
    var a = a
    
    
    func addNumToFreqArr() {
        if currentFrequency > 0 {
            if lowFrequencyNums[currentFrequency] == nil {
                lowFrequencyNums[currentFrequency] = [Int]()
            }
            lowFrequencyNums[currentFrequency]?.append(currentNum)
        } else {
            currentFrequency = 1
        }
        minFrequency = min(minFrequency, currentFrequency)
    }
    
    a.sort()
    for num in a {
        if currentNum != num {
            addNumToFreqArr()
            currentNum = num
            currentFrequency = 1
        } else {
            currentFrequency = currentFrequency + 1
        }
    }
    addNumToFreqArr()
    print(lowFrequencyNums)
    print(minFrequency)
    if let outputNum = lowFrequencyNums[minFrequency]?.sorted().last {
        maxNumLowFreq = outputNum
    }
    return maxNumLowFreq
}

import XCTest
class Tests: XCTestCase {
    func testOneElement() {
        let ret = maxNumLowFrequency(a: [3])
        XCTAssertEqual(ret, 3)
    }
    func testOneLowFreqLowNum() {
        let ret = maxNumLowFrequency(a: [3,3,3,2])
        print(ret)
        XCTAssertEqual(ret, 2)
    }
    func test7ElementsArr() {
        let a = [3,4,23,11, 23, 3, 3]
        let ret = maxNumLowFrequency(a: a)
        XCTAssertEqual(ret, 11)
    }
}

Tests.defaultTestSuite.run()
