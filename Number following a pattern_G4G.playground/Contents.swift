//https://practice.geeksforgeeks.org/problems/number-following-a-pattern/0#ExpectOP
import Foundation

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

var numContainer = Stack<Int>()
var outputMinNum = [Int]()

func printMinimumNumber(s: String) -> Int {
    
    numContainer = Stack<Int>()
    outputMinNum = [Int]()
    
    print("\n")
    print("\n")
    print("_________________________________________________________")
    print("\n")
    print("input s = \(s)")
    initNumContainer(lengh: Array(s).count)
    print("numContainer \(numContainer.count())")
    let letterSets:Stack<LetterSet> = feelLetterSets(s: s)
    print("letterSets.count() = \(letterSets.count())")
    print("letterSets = \(letterSets)")

    createMinimumNumber(letterSets: letterSets)
    print("outputMinNum \(outputMinNum)")

    let stringArray = outputMinNum.map { String($0) }
    let strOutput = stringArray.joined()
    if let num = Int(strOutput) {
        return num
    } else {
        return 0
    }
}

func initNumContainer(lengh: Int) {
    for i in (1 ..< lengh + 2).reversed() {
        numContainer.push(i)
    }
}
func feelLetterSets(s: String) -> Stack<LetterSet> {
    var lastChar: Character =  Array(s.reversed())[0]
    
    let letterSets = Stack<LetterSet>()
    var countChar: Int = 0
    for char in s.reversed() {
        if lastChar != char {
            letterSets.push(LetterSet(letter: lastChar, count: countChar))
            countChar = 0
            lastChar = char
        }
        countChar = countChar + 1
    }
    letterSets.push(LetterSet(letter: lastChar, count: countChar + 1))
    
    return letterSets
}

func createMinimumNumber(letterSets: Stack<LetterSet>) {
    
   var first: Bool = true
    while let letterSet = letterSets.pop()  {
        if first && letterSet.letter == Characters.D.rawValue {
            first = false
            organizedNumber(set1: letterSet, set2: nil)
        } else {
            organizedNumber(set1: letterSet, set2: letterSets.pop())
        }
    }

}

func organizedNumber(set1: LetterSet, set2: LetterSet?) {
    if let set2 = set2 {
        // 2 letters
        addDoubleSequence(set1: set1, set2: set2)
    } else {
        // 1 letter
        addSingleSequence(set: set1)
    }
    print("outputMinNum = \(outputMinNum)")
}


func addDoubleSequence(set1: LetterSet, set2: LetterSet) {
    print("addDoubleSequence set1 = \(set1) set2 = \(set2)")
    //iiddd - 126543
    
    //build 12
    outputMinNum = outputMinNum + numContainer.popIncreace(times: set1.count - 1)
    print("outputMinNum = \(outputMinNum)")
    var allDNums = numContainer.popIncreace(times: set2.count + 1)
    
    //build 6
    outputMinNum = outputMinNum + [allDNums.removeLast()]
    
    //build 543
    outputMinNum = outputMinNum + allDNums.reversed()
}

func addSingleSequence(set: LetterSet) {
     
    if set.letter == Characters.I.rawValue {
        outputMinNum = outputMinNum + numContainer.popIncreace(times: set.count)
    } else {
        outputMinNum = outputMinNum + numContainer.popDecreace(times: set.count)
    }
}

enum Characters: Character {
    case I = "I"
    case D = "D"
}
import XCTest
class Tests: XCTestCase {
    /*
     D
     I
     DD
     IIDDD
     DDIDDIID

     Output
     21
     12
     321
     126543
     321654798
     */
    func test8Letters() {
          let output = printMinimumNumber(s: "DDIDDIID")
          XCTAssertTrue(output == 321654798 ? true : false)
      }
    func test5Letters() {
        let output = printMinimumNumber(s: "IIDDD")
        XCTAssertTrue(output == 126543 ? true : false)
    }
    func testFirstD() {
          let output = printMinimumNumber(s: "DIIDDD")
          XCTAssertTrue(output == 2137654 ? true : false)
    }
    func testOneD() {
          let output = printMinimumNumber(s: "D")
          XCTAssertTrue(output == 21 ? true : false)
    }
    func testOneI() {
          let output = printMinimumNumber(s: "I")
          XCTAssertTrue(output == 12 ? true : false)
    }
    func testJustD() {
          let output = printMinimumNumber(s: "DD")
          XCTAssertTrue(output == 321 ? true : false)
    }
    func testJustI() {
          let output = printMinimumNumber(s: "II")
          XCTAssertTrue(output == 123 ? true : false)
    }

}

Tests.defaultTestSuite.run()
