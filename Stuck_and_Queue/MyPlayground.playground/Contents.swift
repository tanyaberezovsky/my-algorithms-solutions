import Foundation

func startTourIndex(petrol: [Int], distance: [Int]) -> Int{
    var leftPetrol = 0
    var lastNegativeIndex = -1
    for i in 0..<petrol.count {
        leftPetrol = leftPetrol + petrol[i] - distance[i]
        if max(leftPetrol, petrol[i] - distance[i]) < 0 {
            lastNegativeIndex = i
        }
    }
 
    if lastNegativeIndex == -1 {
        return 0
    } else {
        return lastNegativeIndex + 1 < petrol.count ? lastNegativeIndex + 1 : -1
    }
}
//
startTourIndex(petrol: [4,6,7,4], distance: [6,5,3,5])
startTourIndex(petrol: [4,4, 3, 4, 6], distance: [6,2,2,5,5])

startTourIndex(petrol: [4,6,1,24,1], distance: [6,5,3,5,2])

startTourIndex(petrol: [4,5,1,24,1], distance: [6,5,3,5,2])
