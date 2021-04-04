import Foundation
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


