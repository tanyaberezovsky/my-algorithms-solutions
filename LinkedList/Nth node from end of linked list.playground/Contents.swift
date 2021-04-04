import Foundation
//https://practice.geeksforgeeks.org/problems/nth-node-from-end-of-linked-list/1

class Node {
    var num: Int
    var next: Node?
    init(_ num: Int) {
        self.num = num
    }
}

func getNthFromLast(head: Node?, n: Int) -> Int {
    var head = head
    var tail = head
    var n = n
    while n >= 0 {
        if tail == nil {
            return -1
        }
        tail = tail?.next
        n = n - 1
    }
  
    while tail != nil {
        tail = tail?.next
        head = head?.next
    }
    return head?.num ?? -1
}


let head = Node(3)
let node6 = Node(6)
let node9 = Node(9)
let node15 = Node(15)
let node30 = Node(30)

head.next = node6
head.next?.next = node9
head.next?.next?.next = node15
head.next?.next?.next?.next = node30

getNthFromLast(head: head, n: 12)
