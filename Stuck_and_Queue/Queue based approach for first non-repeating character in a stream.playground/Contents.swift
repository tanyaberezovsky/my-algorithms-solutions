import Foundation
//https://practice.geeksforgeeks.org/problems/first-non-repeating-character-in-a-stream/0
enum QueueErrors: Error {
    case noSuchElementException
}
public struct Queue<T> {

    private class Node<T> {
        fileprivate var data: T
        fileprivate var next: Node<T>?
        init(val: T) {
            data = val
        }
    }

    private var first: Node<T>?
    private var last: Node<T>?
    
    public mutating func add(item: T) {
        let newNode = Node(val: item)
        if last != nil {
            last?.next = newNode
        }
        last = newNode
        if first == nil {
            first = newNode
        }
    }
    
    public mutating func remove() throws -> T {
        guard let data = first?.data else { throw QueueErrors.noSuchElementException }
        
        self.first = first?.next
        if first == nil {
            last = nil
        }
        
        return data
    }
    
    
    public func peek() throws -> T {
        guard let data = first?.data else { throw QueueErrors.noSuchElementException }
        return data
    }
    
    public func isEmpty() -> Bool {
        return first == nil
    }
}


func firstNonRepeatingChar(arr:[Character]) {
    var q = Queue<Character>()
    var charArr = [Int](repeating: 0, count: 26)
    let aInt = char2Int(char: "a")
    arr.forEach {
        q.add(item: $0)
        let arrIndex = char2Int(char: $0) - aInt
        charArr[arrIndex] += 1
        print(charArr)
        while q.isEmpty() == false {
            let first = char2Int(char: try! q.peek())
            if charArr[first - aInt] > 1 {
                try! q.remove()
            } else {
                break;
            }
        }
        
    }
    
    if !q.isEmpty() {
        print(try! q.peek())
    } else {
        print(-1)
    }
    
}
func char2Int(char: Character) -> Int {
    return Int(char.unicodeScalars.first?.value ?? 0)
}

firstNonRepeatingChar(arr: ["a","b","a","d"])
firstNonRepeatingChar(arr: ["a","b","a","d","a","b","a","d"])
firstNonRepeatingChar(arr: ["a","q","i","z","p"])
