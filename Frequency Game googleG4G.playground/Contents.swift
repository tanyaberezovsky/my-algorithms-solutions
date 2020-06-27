//https://practice.geeksforgeeks.org/problems/frequency-game/1

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

//var a = [3,4,23,11, 23, 3, 3]
//var ret = maxNumLowFrequency(a: a)
//print(ret)

import XCTest
class Tests: XCTestCase {
    func oneElement() {
        let ret = maxNumLowFrequency(a: [3])
        XCTAssertEqual(ret, 3)
    }
    func oneLowFreqLowNum() {
        let ret = maxNumLowFrequency(a: [3,3,3,2])
        print(ret)
        XCTAssertEqual(ret, 2)
    }
}

Tests.defaultTestSuite.run()
