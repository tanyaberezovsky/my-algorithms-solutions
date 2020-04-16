func canTwoMovies(in movieLengths: [Int], fillFlight flightLength: Int) -> Bool {
    
    //  determine if two movie runtimes add up to the flight length
    var movieLengthsSet = Set<Int>()
    
    var secondMovieLength: Int
    for firstMovieLength in movieLengths {
        secondMovieLength = flightLength - firstMovieLength
        print("secondMovieLength \(movieLengthsSet)")
        print("movieLengthsSet \(secondMovieLength)")
        if movieLengthsSet.contains(secondMovieLength) {
            return true
        }
        movieLengthsSet.insert(firstMovieLength)
    }
    
    return false
}

// tests

import XCTest

class Tests: XCTestCase {
    
    func testShortFlight() {
        let result = canTwoMovies(in: [2, 4], fillFlight: 1)
        XCTAssertFalse(result)
    }
    
    func testLongFlight() {
        let result = canTwoMovies(in: [2, 4], fillFlight: 6)
        XCTAssertTrue(result)
    }
    
    func testOneMovieHalfFlightLength() {
        let result = canTwoMovies(in: [3, 8], fillFlight: 6)
        XCTAssertFalse(result)
    }
    
    func testTwoMoviesHalfFlightLength() {
        let result = canTwoMovies(in: [3, 8, 3], fillFlight: 6)
        XCTAssertTrue(result)
    }
    
    func testLotsOfPossiblePairs() {
        let result = canTwoMovies(in: [1, 2, 3, 4, 5, 6], fillFlight: 7)
        XCTAssertTrue(result)
    }
    
    func testNotUsingFirstMovie() {
        let result = canTwoMovies(in: [4, 3, 2], fillFlight: 5)
        XCTAssertTrue(result)
    }
    
    func testOnlyOneMovie() {
        let result = canTwoMovies(in: [6], fillFlight: 6)
        XCTAssertFalse(result)
    }
    
    func testNoMovies() {
        let result = canTwoMovies(in: [], fillFlight: 2)
        XCTAssertFalse(result)
    }
    
    static let allTests = [
        ("testShortFlight", testShortFlight),
        ("testLongFlight", testLongFlight),
        ("testOneMovieHalfFlightLength", testOneMovieHalfFlightLength),
        ("testTwoMoviesHalfFlightLength",testTwoMoviesHalfFlightLength),
        ("testLotsOfPossiblePairs", testLotsOfPossiblePairs),
        ("testNotUsingFirstMovie", testNotUsingFirstMovie),
        ("testOnlyOneMovie", testOnlyOneMovie),
        ("testNoMovies", testNoMovies)
    ]
}

Tests.defaultTestSuite.run()

//XCTMain([testCase(Tests.allTests)])
