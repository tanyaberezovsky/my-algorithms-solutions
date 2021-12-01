//: [Previous](@previous)

import Foundation

class Node {
    var num: Int
    var next: Node?
    init(_ num: Int) {
        self.num = num
    }
}

func printList(_ head: Node?) {
    print("printList--------------")
    var h: Node? = head
    while h != nil {
        if let num = h?.num {
            print("\(num)")
        }
        h = h?.next
    }
}

func meargeList(_ head1: Node?, _ head2: Node?) -> Node? {
    if firstNodeLess(head1, head2) {
        return innerMeargeList(head1, head2)
    } else {
        return innerMeargeList(head2, head1)
    }
}

func firstNodeLess(_ head1: Node?, _ head2: Node?) -> Bool {
    guard let h1 = head1, let h2 = head2, h1.num < h2.num else {
        return false
    }
    return true
}

func innerMeargeList(_ head1: Node?, _ head2: Node?) -> Node? {
    var h1 = head1?.next
    var runner = head1
    let newHead = head1
    var h2 = head2
    
    while h1 != nil && h2 != nil {
        if firstNodeLess(h1, h2) {
            runner?.next = h1
            h1 = h1?.next
        } else {
            print("h2 num \(h2?.num ?? 0)")
            runner?.next = h2
            h2 = h2?.next
        }
        runner = runner?.next
    }
    
    if h1 != nil && h2 == nil {
        runner?.next = h1
    } else if h1 == nil && h2 != nil {
        runner?.next = h2
    }
    
    return newHead
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

let head2 = Node(3)
head2.next = Node(7)

printList(head)
printList(head2)

let mereged = meargeList(head, head2)

printList(mereged)
