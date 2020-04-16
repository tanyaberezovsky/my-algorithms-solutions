/*
 Breakdown
 The brute force ↴ approach would be to check every permutation of the input string to see if it is a palindrome.
 
 What would be the time cost? For a string of length n, there are n!n! permutations (nn choices for the first character, times n-1n−1 choices for the second character, etc). Checking each length-nn permutation to see if it's a palindrome involves checking each character, taking O(n)O(n) time. That gives us O(n!n)O(n!n) time overall. We can do better!
 
 Let's try rephrasing the problem. How can we tell if any permutation of a string is a palindrome?
 */


func hasPalindromePermutation(in theString: String) -> Bool {
    
    // check if any permutation of the input is a palindrome
    print("theString \(theString)")
    var charSet = Set<Character>()
    // check if any permutation of the input is a palindrome
    for char in theString {
        if charSet.contains(char) {
            charSet.remove(char)
        } else {
            charSet.insert(char)
        }
        print(charSet)
        
    }
    if charSet.count <= 1 {
        return true
    }
    return false
}





// tests

import XCTest

class Tests: XCTestCase {
    
    func testPermutationWithOddNumberOfChars() {
        let result = hasPalindromePermutation(in: "aabcbcd")
        XCTAssertTrue(result)
    }
    
    func testPermutationWithEvenNumberOfChars() {
        let result = hasPalindromePermutation(in: "aabccbdd")
        XCTAssertTrue(result)
    }
    
    func testNoPermutationWithOddNumberOfChars() {
        let result = hasPalindromePermutation(in: "aabcd")
        XCTAssertFalse(result)
    }
    
    func testNoPermutationWithEvenNumberOfChars() {
        let result = hasPalindromePermutation(in: "aabbcd")
        XCTAssertFalse(result)
    }
    
    func testEmptyString() {
        let result = hasPalindromePermutation(in: "")
        XCTAssertTrue(result)
    }
    
    func testOneCharacterString() {
        let result = hasPalindromePermutation(in: "a")
        XCTAssertTrue(result)
    }
    
    static let allTests = [
        ("testPermutationWithOddNumberOfChars", testPermutationWithOddNumberOfChars),
        ("testPermutationWithEvenNumberOfChars", testPermutationWithEvenNumberOfChars),
        ("testNoPermutationWithOddNumberOfChars", testNoPermutationWithOddNumberOfChars),
        ("testNoPermutationWithEvenNumberOfChars", testNoPermutationWithEvenNumberOfChars),
        ("testEmptyString", testEmptyString),
        ("testOneCharacterString", testOneCharacterString)
    ]
}

//XCTMain([testCase(Tests.allTests)])

Tests.defaultTestSuite.run()
