import Foundation
//https://practice.geeksforgeeks.org/problems/remove-loop-in-linked-listrem%20/1

class Node {
    var num: Int
    var next: Node?
    init(_ num: Int) {
        self.num = num
    }
}

func isHaveALoop(_ head: Node?) -> Bool {
    
    var headSlow = head, headQuick = head
    
    while headQuick != nil && headQuick?.next != nil  {
        headQuick = headQuick?.next?.next
        headSlow = headSlow?.next
        if headQuick === headSlow {
            return true
        }
        
    }
    return false
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
node30.next = node6

isHaveALoop(head)

