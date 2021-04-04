import Foundation
//https://practice.geeksforgeeks.org/problems/flattening-a-linked-list/1

class Node {
    var num: Int
    var next: Node?
    var bottom: Node?
    init(_ num: Int) {
        self.num = num
    }
}

func flatten(head: Node?) -> Node? {
    var outerNode = head
    while outerNode != nil {
        var innerNode = outerNode
        var 
        while innerNode?.bottom != nil {
            if innerNode?.bottom == nil {
                
            }
            innerNode = innerNode?.bottom
        }
    }
    return head
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


let bottomHead = Node(4)
let node5 = Node(5)
bottomHead.bottom = node5

head.bottom = bottomHead

head.bottom = bottomHead
