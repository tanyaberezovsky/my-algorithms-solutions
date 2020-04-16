
func reverse(_ str: inout String) {
    
    guard str.count > 1 else {
        return
    }
    
    var startIndex  = str.startIndex
    var endIndex = str.index(before: str.endIndex)
    //var startChar, endChar: Character
    
    while startIndex < endIndex {
        let startChar = str[startIndex]
        let endChar = str[endIndex]
       
        str.replaceSubrange(startIndex...startIndex, with: String(endChar))
        str.replaceSubrange(endIndex...endIndex, with: String(startChar))
        
      //  str.replaceSubrange(startIndex...startIndex, with: String(startChar))
        startIndex = str.index(after: startIndex)
        endIndex = str.index(before: endIndex)
        print(startIndex)
    }
}




// tests

import XCTest

class Tests: XCTestCase {
    
    func testEmptyString() {
        var actual = ""
        let expected = ""
        reverse(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    func testSingleCharacterString() {
        var actual = "A"
        let expected = "A"
        reverse(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    func testLongerString() {
        var actual = "ABCDE"
        let expected = "EDCBA"
        reverse(&actual)
        XCTAssertEqual(actual, expected)
    }
    func testShortString() {
        var actual = "AB"
        let expected = "BA"
        reverse(&actual)
        XCTAssertEqual(actual, expected)
    }
    
//    static let allTests = [
//        ("testEmptyString", testEmptyString),
//        ("testSingleCharacterString", testSingleCharacterString),
//        ("testLongerString", testLongerString)
//    ]
}
Tests.defaultTestSuite.run()

//XCTMain([testCase(Tests.allTests)])
