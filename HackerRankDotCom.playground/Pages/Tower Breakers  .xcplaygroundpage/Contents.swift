//: [Previous](@previous)

import Foundation

func towerBreakers(n: Int, m: Int) -> Int {

    var heights = [Int](repeating: m, count: n)
    var firstWin = true
    while heights.count > 0 {
        heights = makeAMove(heights)
        firstWin = !firstWin
    }
    return firstWin ? 1 : 2
}


func makeAMove(_ heights: [Int]) -> [Int] {
    
    var heights = heights.sorted()
    
    if heights[heights.count - 1] > 1 {
        heights[heights.count - 1] = 1
        return heights
    }

    return [Int]()
}

towerBreakers(n: 2, m: 6)

func fizzBuzz(n: Int) -> Void {
    // Write your code here
    var i = 1
    while i <= n {
        if evenlyDivided(i, 3) && evenlyDivided(i, 5) {
            print("FizzBizz")
        } else if evenlyDivided(i, 3) {
            print("Fizz")
        } else if evenlyDivided(i, 3) {
            print("Bizz")
        } else {
            print(i)
        }
        i += 1
    }
}

func evenlyDivided(_ num: Int, _ division: Int) -> Bool {
    return num % division == 0
}

fizzBuzz(n: 15)
print(3 % 2)
print(4 % 2)
