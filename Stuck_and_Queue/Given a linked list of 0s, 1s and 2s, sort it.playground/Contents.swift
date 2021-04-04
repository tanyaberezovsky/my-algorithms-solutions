//https://practice.geeksforgeeks.org/problems/given-a-linked-list-of-0s-1s-and-2s-sort-it/1
import Foundation

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

func sortList(head: Node?) -> Node? {
    var newHead:Node?
    var node0: Node?
    var node1: Node?
    var node2: Node?
    var runner = head
    while runner != nil {
        let newNode = runner
        runner = runner?.next
        newNode?.next = nil
        if newNode?.num == 0 {
           node0 = addNode(node: node0, newNode: newNode)
            printList(head: node0)
            print("----------------")

        } else if newNode?.num == 1 {
           node1 = addNode(node: node1, newNode: newNode)
            printList(head: node1)
            print("----------------")
        } else {
            node2 = addNode(node: node2, newNode: newNode)
            printList(head: node2)
            print("----------------")
        }
        if newHead == nil {
            newHead = newNode
        } else if let numHead = newHead?.num, let numNew = newNode?.num, numHead > numNew {
            newHead = newNode
        }
    }
    while node0 != nil {
        if node0?.next == nil {
            node0?.next = node1
            break
        }
    }
    while node1 != nil {
        if node1?.next == nil {
            node1?.next = node2
            break
        }
    }
//    node0?.next = node1
//    node1?.next = node2
    return newHead
}

func addNode(node: Node?, newNode: Node?) -> Node? {
    if node != nil {
        newNode?.next = node
    }
    return newNode
}

let head = Node(2)
let node6 = Node(1)
let node9 = Node(1)
let node15 = Node(0)
let node30 = Node(2)
let node31 = Node(1)

head.next = node6
head.next?.next = node9
head.next?.next?.next = node15
head.next?.next?.next?.next = node30
node30.next = node31

printList(head: head)
print("----------------")
let newHead = sortList(head: head)
printList(head: newHead)
