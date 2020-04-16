/*
 You created a game that is more popular than Angry Birds.

 Each round, players receive a score between 0 and 100, which you use to rank them from highest to lowest. So far you're using an algorithm that sorts in O(n\lg{n})O(nlgn) time, but players are complaining that their rankings aren't updated fast enough. You need a faster sorting algorithm.

 Write a function that takes:

 an array of unsortedScores
 the highestPossibleScore in the game
 and returns a sorted array of scores in less than O(n\lg{n})O(nlgn) time.

 For example:

   let unsortedScores = [37, 89, 41, 65, 91, 53]
 let highestPossibleScore = 100

 let sortedScores = sortScores(unsortedScores, withHighest: highestPossibleScore)
 // sortedScores: [91, 89, 65, 53, 41, 37]
 */

func sortScores(_ unsortedScores: [Int], withHighest highestPossibleScore: Int) -> [Int] {
    var dictScores: [Int: Int] = [:]  // or use     var scoreCounts = Array(repeating: 0, count: highestPossibleScore + 1)

    // sort the scores in O(n) time
    for num in unsortedScores {
        //dictScores.e
        if let count = dictScores[num] {
            dictScores[num] = count + 1
        } else {
            dictScores[num] = 1
        }
    }
    
    var sortedScores: [Int] = [Int]()
    for i in (0 ..< highestPossibleScore).reversed() {
        if var count = dictScores[i] {
            while count > 0 {
                sortedScores.append(i)
                count = count - 1
            }
        }
    }
    return sortedScores
}


















// tests

import XCTest

class Tests: XCTestCase {
    
    func testNoScores() {
        let actual = sortScores([], withHighest: 100)
        let expected: [Int] = []
        XCTAssertEqual(actual, expected)
    }
    
    func testOneScore() {
        let actual = sortScores([55], withHighest: 100)
        let expected = [55]
        XCTAssertEqual(actual, expected)
    }
    
    func testTwoScores() {
        let actual = sortScores([30, 60], withHighest: 100)
        let expected = [60, 30]
        XCTAssertEqual(actual, expected)
    }
    
    func testManyScores() {
        let actual = sortScores([37, 89, 41, 65, 91, 53], withHighest: 100)
        let expected = [91, 89, 65, 53, 41, 37]
        XCTAssertEqual(actual, expected)
    }
    
    func testRepeatedScores() {
        let actual = sortScores([20, 10, 30, 30, 10, 20], withHighest: 100)
        let expected = [30, 30, 20, 20, 10, 10]
        XCTAssertEqual(actual, expected)
    }
    
    static let allTests = [
        ("testNoScores", testNoScores),
        ("testOneScore", testOneScore),
        ("testTwoScores", testTwoScores),
        ("testManyScores", testManyScores),
        ("testRepeatedScores", testRepeatedScores)
    ]
}

Tests.defaultTestSuite.run()
