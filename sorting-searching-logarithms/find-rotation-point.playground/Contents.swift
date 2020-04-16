
import Foundation

func findRotationPoint(in words: [String]) -> Int {
    if words.count == 1 {
        return 0
    }
    if words.count == 2 {
        return words[0] < words[1] ? 0 : 1
    }
    print("words \(words)")
    // find the rotation point in the array
    var floor = 0
    var celling = words.count - 1
    var middle = 0
    var minIndex = -1

    while floor + 1 < celling {
        middle = ((celling - floor) / 2) + floor
        print("floor \(floor) middle \(middle) celling \(celling)")
        if words[floor] > words[middle] {
            minIndex = middle
            celling = middle
        } else {
            floor = middle
            minIndex = middle

        }
        print("floor \(floor) middle \(middle) celling \(celling) \(((celling - floor) / 2) + floor)")

    }
    if words[floor] > words[celling] {
        minIndex = celling
    }
    return minIndex
}

//func findRotationPoint(in words: [String]) -> Int {
//    var buton = 0
//    var top = words.count - 1
//    var mid = 0
//    while buton < top {
//        mid = ((top - buton) / 2) + buton
//        if words[mid] >= words[0] {
//            buton = mid
//        } else {
//            top = mid
//        }
//
//        if buton + 1 == top {
//            break
//        }
//    }
//    return top
//}
//func findRotationPoint(in words: [String]) -> Int {
//    let firstWord = words[0]
//
//    var floorIndex = 0
//    var ceilingIndex = words.count - 1
//
//    while floorIndex < ceilingIndex {
//
//        // guess a point halfway between floor and ceiling
//        let guessIndex = floorIndex + ((ceilingIndex - floorIndex) / 2)
//
//        // if guess comes after first word or is the first word
//        if words[guessIndex] >= firstWord {
//            // go right
//            floorIndex = guessIndex
//        } else {
//            // go left
//            ceilingIndex = guessIndex
//        }
//
//        // if floor and ceiling have converged
//        if (floorIndex + 1) == ceilingIndex {
//
//            // between floor and ceiling is where we flipped to the beginning
//            // so ceiling is alphabetically first
//            break
//        }
//    }
//
//    return ceilingIndex
//}


//["grape", "orange", "plum", "radish", "apple"]
// 4, 8, 11, 1, 2
/*
 words = [ "k","v","a","b","c","d","e","g","i" ]

buttom, up , mid [buttom] >= [mid] else
 0      3
            1      buttom = mid    up = mid
 
 
*/
//func compareTwoWords(aWord: String, bWord: String) -> Int {
//    //if
////    var froor = 0
////    var celling = aWord.count < bWord.count ? aWord.count : bWord.count
////
////    for i in 0..<celling {
////        if aWord < bWord {
////
////        }
////    }
//
//}
















// tests

import XCTest

class Tests: XCTestCase {
    
    func testSmallArray() {
        let actual = findRotationPoint(in: ["cape", "cake"])
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testMediumArray() {
        let actual = findRotationPoint(in: ["grape", "orange",
                                            "plum", "radish", "apple"])
        let expected = 4
        XCTAssertEqual(actual, expected)
    }
   
    func testLargeArray() {
        let actual = findRotationPoint(in: ["ptolemaic", "retrograde", "supplant",
                                            "undulate", "xenoepist", "asymptote",
                                            "babka", "banoffee", "engender",
                                            "karpatka", "othellolagkage"])
        let expected = 5
        XCTAssertEqual(actual, expected)
    }
    
    // are we missing any edge cases?
    
    static let allTests = [
        ("testSmallArray", testSmallArray),
        ("testMediumArray", testMediumArray),
        ("testLargeArray", testLargeArray)
    ]
}

//XCTMain([testCase(Tests.allTests)])
Tests.defaultTestSuite.run()
