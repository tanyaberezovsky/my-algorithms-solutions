import Foundation
//https://practice.geeksforgeeks.org/problems/pairwise-swap-elements-of-a-linked-list-by-swapping-data/1


class Node {
    var num: Int
    var next: Node?
    init(_ num: Int) {
        self.num = num
    }
}

func printList( head: Node?) {
    var head = head
    while head != nil {
        print("\(String(describing: head?.num))")
        head = head?.next
    }
}

func pairwise( head: Node?) -> Node? {
    var node = head
    var newHead: Node?
    var parent: Node?
    while node?.next != nil {
        if parent == nil {
            newHead = node?.next
        }
        parent = swap(parent: parent, node: node, node2: node?.next)
        node = node?.next
    }
    return newHead
}

func swap(parent: Node?, node: Node?, node2: Node?) -> Node? {
    let next = node2?.next
    if parent != nil {
        parent?.next = node2
    }
    node2?.next = node
    node2?.next?.next = next
    return node
}

let head = Node(1)
let node6 = Node(2)
let node9 = Node(3)
let node15 = Node(4)
let node30 = Node(5)

head.next = node6
head.next?.next = node9
head.next?.next?.next = node15
head.next?.next?.next?.next = node30

var newHead = pairwise(head: head)
printList(head: newHead)
