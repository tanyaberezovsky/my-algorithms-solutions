import Foundation

struct Stuck2<T> {
    private class Node<T> {
        var val: T?
        var next: Node<T>?
    }
    
}

struct Stack<T> {
    private var stack: Array<T>? = Array<T>()
    
    func printStack() {
        print("Stack count \(stack?.count ?? 0)")
        stack?.forEach {
            print($0)
        }
        //print(Stack ?? "empty Stack")
    }
    func isEmpty() -> Bool {
        guard let count = stack?.count else { return false }
        return count > 0 ? false : true
    }
    
    func pick(i: Int) -> T? {
        return stack?[i]
    }
    
    mutating func pop() -> T? {
        return stack?.popLast()
    }
    
    mutating func push(val: T) {
        stack?.append(val)
    }
}

struct Queue<T> {
    private var stack1: Stack<T> = Stack<T>()
    private var stack2: Stack<T> = Stack<T>()
    
    init() {
       stack1 = Stack<T>()
       stack2 = Stack<T>()
    }
    
    mutating func add(val: T) {
        stack1.push(val: val)
    }
    
    mutating func remove() -> T? {
//        while let val = stack1.pop() {
//            stack2.push(val: val)
//        }
        shiftStacks()
        return stack2.pop()
//        while let val = stack2.pop() {
//            stack1.push(val: val)
//        }
    }
    
    mutating func shiftStacks() {
        if stack2.isEmpty() {
            while let val = stack1.pop() {
                stack2.push(val: val)
            }
        }
    }

}

var q: Queue<Int> = Queue<Int>()
q.add(val: 1)
q.add(val: 2)
q.add(val: 3)
q.remove()
q.add(val: 4)
q.remove()
q.remove()
q.remove()
