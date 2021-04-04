import Foundation

struct LetterSet {
    let letter: String
    let count: Int
}

func printMinimumNumber(s: String) -> Int {
    var output = [Int]()
    var letterSets = feelLetterSets(s: s)
    
//    output = createNumberForFirstSet(letterSets[0])
//    output = createAllNumbersFromSecondSet(s, letterSets, &output)
//
    return output.map(String.init).joined()
}

func feelLetterSets(s: String) -> [LetterSet] {
    var letterSets = [LetterSet]()
    for char in s {
        if char == "I" {
            
        } else {// "D"
            
        }
    }
    return letterSets
}

import XCTest
class Tests: XCTestCase {
    /*
     D
     I
     DD
     IIDDD
     DDIDDIID

     Output
     21
     12
     321
     126543
     321654798
     */
    
    func test5Letters() {
        let output = printMinimumNumber(s: "IIDDD")
        XCTAssertTrue(output == 126543 ? true : false)
    }

}

Tests.defaultTestSuite.run()
