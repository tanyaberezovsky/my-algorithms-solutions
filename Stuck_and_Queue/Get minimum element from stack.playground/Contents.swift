import Foundation
//https://www.geeksforgeeks.org/design-and-implement-special-stack-data-structure/
enum StackErrors: Error {
    case emptyStack
}

struct Stack<T> where T: Comparable {
    
    private class Node<T> {
        var data: T
        var min: T
        var next: Node<T>?
        init(data: T, min: T) {
            self.data = data
            self.min = min
        }
    }
    
    private var top: Node<T>?
    
    public mutating func push(data: T) {
        var lastMin = data
        //ignore throw
        if isEmpty() == false {
            lastMin = try! getMin()
        }
        let node = Node(data: data, min: min(lastMin, data))
        node.next = top
        top = node
    }
    
    public mutating func pop() throws -> T {
        guard let data = top?.data else {
            throw StackErrors.emptyStack
        }
        top = top?.next
        return data
    }
    
    public func isEmpty() -> Bool {
        return top == nil
    }
    public func peek() throws -> T {
        guard let data = top?.data else {
            throw StackErrors.emptyStack
        }
        return data
    }
    
    public func getMin() throws -> T {
        guard let min = top?.min else { throw StackErrors.emptyStack }
        return min
    }
}

var s = Stack<Int>()
s.push(data: 10)
s.push(data: 20)
s.push(data: 30)
s.push(data: 5)
try s.getMin()
try s.pop()
try s.getMin()
try s.pop()
try s.getMin()
