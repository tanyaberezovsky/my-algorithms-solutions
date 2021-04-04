//https://practice.geeksforgeeks.org/problems/minimum-platforms/0
//https://www.geeksforgeeks.org/minimum-number-platforms-required-railwaybus-station/
//https://www.youtube.com/watch?v=38JLfQGVlkw

import Foundation

func minPlatforms(arrival:[Int], departure:[Int]) -> Int {
    guard arrival.count > 1 else { return 1 }
    var arrival = arrival
    arrival.sort()
    var departure = departure
    departure.sort()
    var platforms = 1
    var maxplatforms = 0
    var lastDeparture = departure[0]
    
    for i in 1 ..< departure.count {
        print("lastDeparture \(lastDeparture) arrival[i] \(arrival[i] )")
                
        if lastDeparture > arrival[i] {
            platforms = platforms + 1
            maxplatforms = max(maxplatforms, platforms)
        } else {
            platforms = platforms - 1
            lastDeparture = departure[i]
        }
        print(platforms)
    }
    
    return maxplatforms == 0 ? 1: maxplatforms
}


import XCTest
class Tests: XCTestCase {

    func testminPlatforms_3platform() {
        let output = minPlatforms(arrival: [900,  940, 950,  1100, 1500, 1800], departure: [910, 1200, 1120, 1130, 1900, 2000])
        print(output)
        XCTAssertTrue(output == 3 ? true : false)
      }
//    //
//    func testminPlatforms_1platform() {
//      let output = minPlatforms(arrival: [0900, 1100, 1235], departure: [1000, 1200, 1240] )
//      print(output)
//      XCTAssertTrue(output == 1 ? true : false)
//    }
    func testminPlatforms_2platform() {
        let output = minPlatforms(arrival: [0920, 0930, 1000, 1030, 1042, 1100,1300], departure: [1100, 0940, 1020, 1040, 1052,1400,1500] )
         print(output)
         XCTAssertTrue(output == 2 ? true : false)
       }
    func testminPlatforms_2platformSecondTry() {
        let output = minPlatforms(arrival: [900, 0930, 1015], departure: [1000, 1030, 1045] )
         print(output)
         XCTAssertTrue(output == 2 ? true : false)
    }
}

Tests.defaultTestSuite.run()


/*
    var list = trainRides.Where(
        otherTrain =>
            (trainRide.Arrival >= otherTrain.Arrival && trainRide.Arrival <= otherTrain.Departure) ||
            (trainRide.Departure <= otherTrain.Departure && trainRide.Departure >= otherTrain.Arrival) ||
           (trainRide.Arrival >= otherTrain.Arrival && trainRide.Departure <= otherTrain.Departure)
 );
 
 */
