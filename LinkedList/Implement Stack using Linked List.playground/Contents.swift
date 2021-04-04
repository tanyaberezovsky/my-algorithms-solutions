import Foundation
//https://practice.geeksforgeeks.org/problems/implement-stack-using-linked-list/1

class Node {
    var num: Int
    var next: Node?
    init(_ num: Int) {
        self.num = num
    }
}

struct Queue {
    var front: Node?
    mutating func push(num: Int) {
        let node = Node(num)
        if front != nil {
            node.next = front
        }
        front = node
    }

    mutating func pop() -> Int? {
        if front != nil {
            let num = front?.num
            let tmp = front
            front = front?.next
            tmp?.next = nil
            return num
        }
        return nil
    }
}


func query(_ query: String) {
    var queue = Queue()
    let array: [Int] = query.split(separator: " ").map {
        return Int($0) ?? 0
    }
    var i = 0
    while i < array.count {
        if array[i] == 2 {
            print(queue.pop() ?? -1)
        } else {
            if i+1 <= array.count {
                queue.push(num: array[i+1])
                i += 1
            }
        }
        i += 1
    }
}

query("1 2 1 3 2 1 4 2")
query("1 2 2 2 1 3")
query("2 1 4 1 5 2")
