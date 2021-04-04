import Foundation
//https://www.geeksforgeeks.org/design-a-stack-that-supports-getmin-in-o1-time-and-o1-extra-space/
enum StackErrors: Error {
    case emptyStack
}

struct Stack<T> where T: Comparable {
    
    private class Node<T> {
        var data: T
        var next: Node<T>?
        init(data: T) {
            self.data = data
        }
    }
    
    private var top: Node<T>?
    private var minArr = [T]()
    
    public mutating func push(data: T) {
        let node = Node(data: data)
        node.next = top
        top = node
        if let lastMin = minArr.last {
            let minData = min(lastMin, data)
            minArr.append(minData)
        } else {
            minArr.append(data)
        }
    }
    
    public mutating func pop() throws -> T {
        guard let data = top?.data else {
            throw StackErrors.emptyStack
        }
        top = top?.next
        minArr.removeLast()
        return data
    }
    
    public mutating func peek() throws -> T {
        guard let data = top?.data else {
            throw StackErrors.emptyStack
        }
        
        return data
    }
    
    public mutating func getMin() throws -> T {
        guard let lastMin = minArr.last else {
            throw StackErrors.emptyStack
        }
        return lastMin
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
