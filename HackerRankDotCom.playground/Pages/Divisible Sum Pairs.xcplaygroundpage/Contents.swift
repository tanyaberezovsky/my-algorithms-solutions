//: [Previous](@previous)

import Foundation


func divisibleSumPairsNaive(n: Int, k: Int, ar: [Int]) -> Int {
    
    var pairCount = 0
    
    for i in 0 ..< ar.count {
        for j in i + 1 ..< ar.count {
            
            if (ar[i] + ar[j]) % k == 0 {
            
                pairCount += 1
            }
            
        }
    }
    
    return pairCount
}

    //var
    // 1, 1, 2, 2, 3, 6
    /*
     from collections import defaultdict

     def divisibleSumPairs(n, k, ar):
         hash_map = defaultdict(int)
         pairs_count = 0
         for num in ar:
             need = (k - num % k ) % k
             pairs_count += hash_map[need]
             hash_map[num%k] += 1
         return pairs_count
    */
func divisibleSumPairs(n: Int, k: Int, ar1: [Int]) -> Int {
    
    var pairCount = 0

    var key = 0
    
    ar1.forEach { num in
        key = (k - num % k) % k
        print("key \(key)")
        print(num % k)
    }
    
    return pairCount
}


divisibleSumPairs(n: 0, k: 3, ar1: [1, 3, 2, 6, 1, 2])

