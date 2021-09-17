//: [Previous](@previous)

import Foundation
func minimumBribes(q: [Int]) -> Void {
   // var d = [Int:Int]()
    var q = q
    var bribes = 0
    var i = q.count - 1
    while i > 0 {
        
        let expectedVal = i+1
        print("i \(i) val \(expectedVal) q[i] \(q[i])")
        
        if q[i] == expectedVal {
            i -= 1
            continue
        }
        
      
        
            if i-1>=0 && q[i-1] == expectedVal  {
                bribes = bribes + 1
                q.swapAt(i-1, i)
               // print(q)
            } else if i-2>=0 && q[i-2] == expectedVal {
                bribes = bribes + 2
                //print(q)
                q.insert(q[i-2], at: i+1)
                //print(q)
                q.remove(at: i-2)
                //print(q)
            } else {
                print("Too chaotic")
                return
            }
        
        
    }
    //print("OK \(q)")
    print("\(bribes)")
    return
}

//
//func minimumBribes(q: [Int]) -> Void {
//    var q = q
//    var bribes = 0
//    var i = q.count - 1
//    while i >= 0 {
//        let diff = q[i] - 1 - i
//
//
//    }
//}

//1+2 23
//321
//minimumBribes(q: [3,1,2,5,4]) //- 12354 - 12345
//
//minimumBribes(q: [1,2,4,5,3]) //- 12345
//minimumBribes(q: [1,2,5,4,3]) //- tmp=5 q[i-1]=4
////123443
////123433
////123435
//
//minimumBribes(q: [1,2,5,3,7,8,6,4]) //- 12354 - 12345


minimumBribes(q: [2,1,5,3,4]) // 12534 -12345
//minimumBribes(q: [2,5,1,3,4]) //
//minimumBribes(q: [1,2,3,5,4,6,7,8])
//var q = [3,1,2,5,4]
//q.insert(3, at: 3)
//q.remove(at: 0)
//print(q)
