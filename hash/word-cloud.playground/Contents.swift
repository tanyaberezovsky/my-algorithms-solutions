import Foundation

extension Character {
    func isLetter() -> Bool {
        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(self)
    }
    func isLegalWordChar() -> Bool {
        return "'-'".contains(self)
    }
}
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
class WordCloudData {
    
    private(set) var wordsToCounts: [String: Int] = [:]
    
    init(_ input: String) {
        populateWordsToCounts(input)
    }
    
    private func populateWordsToCounts(_ input: String) {
        
        // count the frequency of each word
        splitWords(input)
        
    }
    
    private func splitWords(_ input: String) {
        print(input)
        var startWordCharIndex = input.startIndex
        var endWordCharIndex = input.startIndex
        
        for char in input {
            
            if !(char.isLetter || char.isLegalWordChar()) {
                print(input[startWordCharIndex..<endWordCharIndex])
                if startWordCharIndex != endWordCharIndex {
                    addToDictionary(String(input[startWordCharIndex..<endWordCharIndex]))
                }
                startWordCharIndex = input.index(after: endWordCharIndex)
            }
            endWordCharIndex = input.index(after: endWordCharIndex)
        }
        if startWordCharIndex != endWordCharIndex {
            addToDictionary(String(input[startWordCharIndex..<endWordCharIndex]))
        }
        
    }
    
    private func addToDictionary(_ key: String) {
        if key == "-" { return }
        if let count = wordsToCounts[key] {
            wordsToCounts[key] = count + 1
        } else if let count = wordsToCounts[key.lowercased()] {
            wordsToCounts[key.lowercased()] = count + 1
        } else if let count = wordsToCounts[key.capitalizingFirstLetter()] {
            wordsToCounts[key.lowercased()] = count + 1
            wordsToCounts[key.capitalizingFirstLetter()] = nil
        } else {
             wordsToCounts[key] = 1
        }
    }
}


















// tests

// there are lots of valid solutions for this one. you
// might have to edit some of these tests if you made
// different design decisions in your solution

import XCTest

class Tests: XCTestCase {
    
    func testSimpleSentence() {
        let input = "I like cake"
        let wordCloud = WordCloudData(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["I": 1, "like": 1, "cake": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testLongerSentence() {
        let input = "Chocolate cake for dinner and pound cake for dessert"
        let wordCloud = WordCloudData(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = [
            "and": 1,
            "pound": 1,
            "for": 2,
            "dessert": 1,
            "Chocolate": 1,
            "dinner": 1,
            "cake": 2
        ]
        XCTAssertEqual(actual, expected)
    }
    
    func testPunctuation() {
        let input = "Strawberry short cake? Yum!"
        let wordCloud = WordCloudData(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["cake": 1, "Strawberry": 1, "short": 1, "Yum": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testHyphenatedWords() {
        let input = "Dessert - mille-feuille cake"
        let wordCloud = WordCloudData(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["cake": 1, "Dessert": 1, "mille-feuille": 1]
        XCTAssertEqual(actual, expected)
    }
    
    func testEllipsesBetweenWords() {
        let input = "Mmm...mmm...decisions...decisions"
        let wordCloud = WordCloudData(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["mmm": 2, "decisions": 2]
        XCTAssertEqual(actual, expected)
    }
    
    func testApostrophes() {
        let input = "Allie's Bakery: Sasha's Cakes"
        let wordCloud = WordCloudData(input)
        
        let actual = wordCloud.wordsToCounts
        let expected = ["Bakery": 1, "Cakes": 1, "Allie's": 1, "Sasha's": 1]
        XCTAssertEqual(actual, expected)
    }
    
    static let allTests = [
        ("testSimpleSentence", testSimpleSentence),
        ("testLongerSentence", testLongerSentence),
        ("testPunctuation", testPunctuation),
        ("testHyphenatedWords", testHyphenatedWords),
        ("testEllipsesBetweenWords", testEllipsesBetweenWords),
        ("testApostrophes", testApostrophes)
    ]
}

Tests.defaultTestSuite.run()
