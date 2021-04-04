import Foundation

//Check if Linked List is Palindrome
//https://practice.geeksforgeeks.org/problems/check-if-linked-list-is-pallindrome/1



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

func isPolindrome( head: Node?) -> Bool {
    var len = lenght(head: head) / 2 + 1
    var first = head
    var second = head
    var ret = false
    while len > 0 {
        second = second?.next
        len -= 1
    }
    second = reverse(head: second)
    var tail = second
    while first != nil && second != nil {
        if let num1 = first?.num, let num2 = second?.num, num1 == num2 {
            first = first?.next
            second = second?.next
            ret = true
        } else {
            ret = false
        }
    }
    while first?.next != nil {
        first = first?.next
    }
    
    tail = reverse(head: tail)
    first?.next = tail
    
    return ret
}

func lenght( head: Node?) -> Int {
    var head = head
    var i = 0
    while (head != nil) {
        head = head?.next
        i += i
    }
    return i
}

func reverse( head: Node?) -> Node? {
    var next = head
    var prev: Node?// = null
    var current: Node? // = null
    while next != nil {
        current = next
        next = current?.next
        current?.next = prev
        prev = current
    }
    return current
}



//let head = Node(1)
//let node6 = Node(2)
//let node9 = Node(3)
//let node15 = Node(4)
//let node30 = Node(5)
let head = Node(1)
let node6 = Node(2)
let node9 = Node(3)
let node15 = Node(2)
let node30 = Node(1)

head.next = node6
head.next?.next = node9
head.next?.next?.next = node15
head.next?.next?.next?.next = node30

isPolindrome(head: head)
//var newHead = pairwise(head: head)
printList(head: head)

