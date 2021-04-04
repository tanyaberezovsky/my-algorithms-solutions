import Foundation

enum StackErrors: Error {
    case emptyStack
}
struct Stack<T> {
    
    private class Node<T> {
        public var val: T
        public var next: Node<T>?
        init(val: T) {
            self.val = val
        }
    }
    
    private var top: Node<T>?
    
    
    public mutating func push(val: T) {
        let node = Node<T>(val: val)
        
        node.next = top
        top = node
    }
    
    public mutating func pop() throws -> T {
        guard let val = top?.val
        else {
            throw StackErrors.emptyStack
        }
        top = top?.next
        return val
    }
    
    public func peek() throws -> T {
        guard let val = top?.val
        else {
            throw StackErrors.emptyStack
        }
        return val
    }

    public func isEmpty() -> Bool {
        return top == nil
    }
    
}

var s = Stack<Int>()
s.push(val: 1)
s.push(val: 2)
s.push(val: 3)
try s.pop()
try s.pop()
try s.pop()
//try s.pop()
