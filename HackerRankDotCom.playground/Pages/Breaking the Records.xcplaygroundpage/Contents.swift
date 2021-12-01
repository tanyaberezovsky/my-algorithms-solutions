//: [Previous](@previous)

import Foundation


func breakingRecords(scores: [Int]) -> [Int] {

    var minScore: Int = scores[0]
    var maxScore: Int = scores[0]
    
    var countMin = 0
    var countMax = 0
    
    scores.forEach { score in
        
        if minScore > score {
            minScore = score
            countMin += 1
            
        } else if maxScore < score {
            maxScore = score
            countMax += 1
        }
        
    }
    
    return [countMax, countMin]
}


breakingRecords(scores: [12, 24, 10, 24])


breakingRecords(scores: [12, 24, 10, 25])
