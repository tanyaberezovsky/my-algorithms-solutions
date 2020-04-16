import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
           var nextN: Int = n
           var oldN: Int
           repeat {
               oldN = nextN
               nextN = 0
                var rem: Int = oldN
                var digit: Int = oldN
                repeat {
                    if rem / 10 == 0 {
                        digit = rem
                        rem = 0
                    } else {
                        digit = digit % 10
                        rem = rem / 10
                    }
                    nextN = nextN + (digit * digit)
                    
                } while rem > 0
           } while oldN != nextN || nextN != 1
           return nextN == 1 ? true : false
       }
//    func isHappy(_ n: Int) -> Bool {
//        var nextN: Int = n
//        var oldN: Int
//        repeat {
//            oldN = nextN
//
//            let digits = "\(nextN)".compactMap{ $0.wholeNumberValue }
//            nextN = 0
//            for digit in digits {
//                nextN = nextN + (digit * digit)
//            }
//            print(nextN)
//        } while oldN != nextN || nextN != 1
//
//        return nextN == 1 ? true : false
//    }
}


var happyNum = Solution()
print("happy num 19 = \(happyNum.isHappy(19))")

print(9/10)

print(51/10)

