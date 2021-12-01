//: [Previous](@previous)

import Foundation


// Stuck LIFO

struct Stuck<T> {
    private var stuck = [T]()
    
    var count: Int {
        return stuck.count
    }
    
    mutating func push(_ val: T) {
        stuck.append(val)
    }
    
    mutating func pop() -> T? {
        return stuck.removeLast()
    }
    
    func peek() -> T? {
        return stuck.last
    }
}

//QUEUE FIFO
struct Queue<T> {
    private var inStuck = Stuck<T>()
    private var outStuck = Stuck<T>()
//    1 x: Enqueue element  into the end of the queue.
    mutating func enqueue(val: T) {
        fillInStuck()
        inStuck.push(val)
    }
//    2: Dequeue the element at the front of the queue.
    mutating func dequeue() -> T? {
        fillOutStuck()
        return outStuck.pop()
    }
//    3: Print the element at the front of the queue.
    mutating func print() -> T? {
        fillOutStuck()
        return outStuck.peek()
    }
    
    mutating private func fillOutStuck() {
        while let val = inStuck.pop() {
            outStuck.push(val)
        }
    }
    
    mutating private func fillInStuck() {
        while let val = outStuck.pop() {
            inStuck.push(val)
        }
    }
}
