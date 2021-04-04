import Foundation
//https://practice.geeksforgeeks.org/problems/detect-loop-in-linked-list/1

class Node {
    var num: Int
    var next: Node?
    init(_ num: Int) {
        self.num = num
    }
}

func isHaveALoop(_ head: Node?) -> (isLoop: Bool, intersecNode: Node?, count: Int) {
    
    var headSlow = head, headQuick = head
    var i = 0
    while headQuick != nil && headQuick?.next != nil  {
        headQuick = headQuick?.next?.next
        headSlow = headSlow?.next
        if headQuick === headSlow {
            return (true, headQuick, i)
        }
        i += 1
    }
    return (false, nil, 0)
}

func detectLoop(_ head: Node?) {
    let returns = isHaveALoop(head)
    if !returns.isLoop { return }

    var head = head, loopNode = returns.intersecNode
    var i = returns.count
    if head === returns.intersecNode {
        while i > 0 {
            head = head?.next
            i -= 1
        }
        head?.next = nil
        return
    }
    while head?.next !== loopNode?.next {
        head = head?.next
        loopNode = loopNode?.next
    }
    loopNode?.next = nil
}

func printList(_ head: Node?) {
    var head = head
    while head != nil {
        print(head?.num ?? 0)
        head = head?.next
    }
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
node30.next = head

detectLoop(head)
printList(head)


