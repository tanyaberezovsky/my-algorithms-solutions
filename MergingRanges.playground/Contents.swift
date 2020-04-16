import Foundation










class Meeting: CustomStringConvertible, Equatable {
    
    var startTime: Int
    var endTime: Int
    
    init(startTime: Int, endTime: Int) {
        
        // number of 30 min blocks past 9:00 am
        self.startTime = startTime
        self.endTime = endTime
    }
    
    var description: String {
        return "(\(startTime), \(endTime))"
    }
    
    static func == (lhs: Meeting, rhs: Meeting) -> Bool {
        return lhs.startTime == rhs.startTime && lhs.endTime == rhs.endTime
    }
}

func mergeRanges(in meetings: [Meeting]) -> [Meeting] {
    
    // merge meeting ranges
    meetings.so
    
    return []
}


















// tests

import XCTest

class Tests: XCTestCase {
    
    func testMeetingsOverlap() {
        let meetings = [
            Meeting(startTime: 1, endTime: 3),
            Meeting(startTime: 2, endTime: 4)
        ]
        let actual = mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 4)
        ]
        XCTAssertEqual(actual, expected)
    }
    
    func testMeetingsTouch() {
        let meetings = [
            Meeting(startTime: 5, endTime: 6),
            Meeting(startTime: 6, endTime: 8)
        ]
        let actual = mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 5, endTime: 8)
        ]
        XCTAssertEqual(actual, expected)
    }
    
    func testMeetingContainsOtherMeeting() {
        let meetings = [
            Meeting(startTime: 1, endTime: 8),
            Meeting(startTime: 2, endTime: 5)
        ]
        let actual = mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 8)
        ]
        XCTAssertEqual(actual, expected)
    }
    
    func testMeetingsStaySeparate() {
        let meetings = [
            Meeting(startTime: 1, endTime: 3),
            Meeting(startTime: 4, endTime: 8)
        ]
        let actual = mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 3),
            Meeting(startTime: 4, endTime: 8)
        ]
        XCTAssertEqual(actual, expected)
    }
    
    func testMultipleMergedMeetings() {
        let meetings = [
            Meeting(startTime: 1, endTime: 4),
            Meeting(startTime: 2, endTime: 5),
            Meeting(startTime: 5, endTime: 8)
        ]
        let actual = mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 8)
        ]
        XCTAssertEqual(actual, expected)
    }
    
    func testMeetingsNotSorted() {
        let meetings = [
            Meeting(startTime: 5, endTime: 8),
            Meeting(startTime: 1, endTime: 4),
            Meeting(startTime: 6, endTime: 8)
        ]
        let actual = mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 4),
            Meeting(startTime: 5, endTime: 8)
        ]
        XCTAssertEqual(actual, expected)
    }
    
    func testOneLongMeetingContainsSmallerMeetings() {
        let meetings = [
            Meeting(startTime: 1,  endTime: 10),
            Meeting(startTime: 2,  endTime: 5),
            Meeting(startTime: 6,  endTime: 8),
            Meeting(startTime: 9, endTime: 10),
            Meeting(startTime: 10,  endTime: 12)
        ]
        let actual = mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 1, endTime: 12)
        ]
        XCTAssertEqual(actual, expected)
    }
    
    func testSampleInput() {
        let meetings = [
            Meeting(startTime: 0,  endTime: 1),
            Meeting(startTime: 3,  endTime: 5),
            Meeting(startTime: 4,  endTime: 8),
            Meeting(startTime: 10, endTime: 12),
            Meeting(startTime: 9,  endTime: 10)
        ]
        let actual = mergeRanges(in: meetings)
        let expected = [
            Meeting(startTime: 0, endTime: 1),
            Meeting(startTime: 3, endTime: 8),
            Meeting(startTime: 9, endTime: 12)
        ]
        XCTAssertEqual(actual, expected)
    }
    
    static let allTests = [
        ("testMeetingsOverlap", testMeetingsOverlap),
        ("testMeetingsTouch", testMeetingsTouch),
        ("testMeetingContainOtherMeeting", testMeetingContainsOtherMeeting),
        ("testMeetingsStaySeparate", testMeetingsStaySeparate),
        ("testMultipleMergedMeetings", testMultipleMergedMeetings),
        ("testMeetingsNotSorted", testMeetingsNotSorted),
        ("testOneLongMeetingContainsSmallerMeetings", testOneLongMeetingContainsSmallerMeetings),
        ("testSampleInput", testSampleInput)
    ]
}

XCTMain([testCase(Tests.allTests)])
