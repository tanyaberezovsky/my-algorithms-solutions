import Foundation
//https://practice.geeksforgeeks.org/problems/merge-two-sorted-linked-lists/1

class Node {
    var num: Int
    var next: Node?
    init(_ num: Int) {
        self.num = num
    }
}

func mergebad(head1: Node?, head2: Node?) -> Node? {
    var newHead: Node?// = head1
    var list1: Node?// = head1
    var list2: Node?// = head2
    print("head1 \(head1?.num)")
    print("head2 \(head2?.num)")

    if let num1 = head1?.num, let num2 = head2?.num, num1 > num2 {
        //merge(head1: list2, head2: list1)
        newHead = head2
        list1 = head2
        list2 = head1
    print("newHead 9: \(newHead?.num)")
        
    } else {
        newHead = head1
        list1 = head1
        list2 = head2
        print("newHead 10: \(newHead?.num) ...")
    }
    
    while list1?.next != nil && list2?.next != nil {
        
        print("aloo1 \(list1?.num)")
        print("aloo2 \(list2?.num)")
        if let num2 = list2?.num, let num1 = list1?.num, let num1Next = list1?.next?.num {
            if num1 < num2 && num2 > num1Next {
                print("ahoj2")
                list1 = list1?.next
                continue
            }
        }
        if let num1 = list1?.num, let num2 = list2?.num, num1 < num2 {
            let tmp = list1?.next
            list1?.next = list2
            list1?.next?.next = tmp
            list1 = list2
            list2 = list2?.next
         //   insertNodeToList1(list1: list1, list2: list2)
        } else {
//            insertNodeToList1(list1: list2, list2: list1)
            let tmp = list2?.next
            list2?.next = list1
            list2?.next?.next = tmp
            list2 = list1
            list1 = list1?.next
        }
    }
    if list1?.next == nil && list2?.next != nil {
        list1?.next = list2
    } else if list2?.next == nil && list1?.next != nil {
        list2?.next = list1
    }
    return newHead
}

func insertNodeToList1(list1: Node?, list2: Node?) {
    var list1 = list1
    var list2 = list2
    let tmp = list1?.next
    list1?.next = list2
    list1?.next?.next = tmp
    list1 = tmp
    list2 = list2?.next
}

func merge(head1: Node?, head2: Node?) -> Node? {
    if let num1 = head1?.num, let num2 = head2?.num, num1 > num2 {
        return merge2List(head1: head2, head2: head1)
    } else {
        return merge2List(head1: head1, head2: head2)
    }
}

func merge2List(head1: Node?, head2: Node?) -> Node? {
    var node1 = head1
    var node2 = head2
    
    var newHead = head1
    
    var runner = newHead
    
    node1 = node1?.next
    
    while node1 != nil && node2 != nil {
        if let num1 = node1?.num, let num2 = node2?.num, num1 < num2 {
            runner?.next = node1
            node1 = node1?.next
        } else {
            runner?.next = node2
            node2 = node2?.next
        }
        runner = runner?.next
    }
    
    if node1 != nil && node2 == nil {
        runner?.next = node1
    } else if node1 == nil && node2 != nil {
        runner?.next = node2
    }
    return newHead
}

func printList( head: Node?) {
    var head = head
    while head != nil {
        print("\(String(describing: head?.num))")
        head = head?.next
    }
}
let head = Node(5)
let node6 = Node(6)
let node9 = Node(9)
let node15 = Node(15)
let node30 = Node(30)

head.next = node6
head.next?.next = node9
head.next?.next?.next = node15
head.next?.next?.next?.next = node30

let head2 = Node(2)
head2.next = Node(4)
head2.next?.next = Node(19)

let newHead = merge(head1: head, head2: head2)
printList(head: head)
printList(head: head2)
printList(head: newHead)
