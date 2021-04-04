//https://practice.geeksforgeeks.org/problems/leaders-in-an-array/0
import Foundation

struct LetterSet {
    let letter: Character
    let count: Int
}
class Stack<T> {
    var storage = [T]()
    
    func push(_ thing: T) {
        storage.append(thing)
    }
    func show() -> T? {
        if isEmpty() {
            return nil
        } else {
            return storage[storage.count-1]
        }
    }
    
    func pop() -> T? {
        if isEmpty() {
            return nil
        } else {
            return storage.popLast()
        }
    }
    func count() -> Int {
        return storage.count
    }
    func isEmpty() -> Bool {
        return storage.count == 0
    }
    
    func popIncreace(times: Int) -> [T] {
       var tmpArr = [T]()
        var i = times
       while i > 0 {
        if let element = pop() {
            tmpArr.append(element)
        }
        i = i - 1
       }
       return tmpArr
    }
       
    func popDecreace(times: Int) -> [T] {
        return popIncreace(times: times).reversed()
    }
}

var numLeaders = Stack<Int>()

//16 17 4 3 5 2

func findLeaders(a:[Int]) -> [Int] {
    
    a.forEach {
        if numLeaders.isEmpty() {
            numLeaders.push($0)
        } else if let last = numLeaders.show(), $0 > last {
            popTill($0)
            print(numLeaders.storage)
            numLeaders.push($0)
        } else {
            numLeaders.push($0)
        }
        print(numLeaders.storage)
    }
    return numLeaders.storage
}

func popTill(_ numLimit: Int) {
    print("popTill")
    if let num = numLeaders.show(), num < numLimit {
        numLeaders.pop()
        popTill(numLimit)
    }
}


import XCTest
class Tests: XCTestCase {

    func testfindLeaders1() {
        let output = findLeaders(a: [16, 17, 4, 3, 5, 2])
        print(output)
        XCTAssertTrue(output.count == 3 ? true : false)
      }
    

}

Tests.defaultTestSuite.run()
