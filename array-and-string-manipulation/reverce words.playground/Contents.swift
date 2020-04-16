func reverseWords(_ message: inout String) {
    guard message.count > 1 else {
        return
    }
    print(message)
    reverse(&message, startIndex: message.startIndex, endIndex: message.index(before: message.endIndex))
    print(message)
    
    
    var startIndex = message.startIndex
    var endIndex = message.index(after: message.startIndex)
    
    var currentChar: Character
    while endIndex < message.endIndex {
        
        
        currentChar = message[endIndex]
       // print("currentChar \(currentChar)")
        
        if currentChar == " " {
            reverse(&message, startIndex: startIndex, endIndex: message.index(before: endIndex))
            startIndex = message.index(after: endIndex)
        }
        
        endIndex = message.index(after: endIndex)
        
    }
    reverse(&message, startIndex: startIndex, endIndex: message.index(before: endIndex))
    print(message)
}




func reverse(_ str: inout String, startIndex: String.Index, endIndex: String.Index) {
    
    guard str.count > 1, startIndex < endIndex else {
        return
    }
    
    var startIndex  = startIndex//str.startIndex
    var endIndex = endIndex//str.index(before: str.endIndex)
    //var startChar, endChar: Character
    
    while startIndex < endIndex {
        let startChar = str[startIndex]
        let endChar = str[endIndex]
        
        str.replaceSubrange(startIndex...startIndex, with: String(endChar))
        str.replaceSubrange(endIndex...endIndex, with: String(startChar))
        
        //  str.replaceSubrange(startIndex...startIndex, with: String(startChar))
        startIndex = str.index(after: startIndex)
        endIndex = str.index(before: endIndex)
        //print(startIndex)
    }
}
















// tests

import XCTest

class Tests: XCTestCase {
    
    func testOneWord() {
        let expected = "vault"
        var actual = "vault"
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    func testTwoWords() {
        let expected = "cake thief"
        var actual = "thief cake"
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    func testThreeWords() {
        let expected = "get another one"
        var actual = "one another get"
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    func testMultipleWordsSameLength() {
        let expected = "the cat ate the rat"
        var actual = "rat the ate cat the"
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    func testMultipleWordsDifferentLengths() {
        let expected = "chocolate bundt cake is yummy"
        var actual = "yummy is cake bundt chocolate"
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }
    func testLastSmallWord() {
        let expected = "vault is"
        var actual = "is vault"
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }
    func testEmptyString() {
        let expected = ""
        var actual = ""
        reverseWords(&actual)
        XCTAssertEqual(actual, expected)
    }
    
    static let allTests = [
        ("testOneWord", testOneWord),
        ("testTwoWords", testTwoWords),
        ("testThreeWords", testThreeWords),
        ("testMultipleWordsSameLength", testMultipleWordsSameLength),
        ("testMultipleWordsDifferentLengths", testMultipleWordsDifferentLengths),
        ("testEmptyString", testEmptyString)
    ]
}
Tests.defaultTestSuite.run()

//XCTMain([testCase(Tests.allTests)])
