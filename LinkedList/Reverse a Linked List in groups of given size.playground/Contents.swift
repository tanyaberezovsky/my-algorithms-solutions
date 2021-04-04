import Foundation

//https://practice.geeksforgeeks.org/problems/reverse-a-linked-list-in-groups-of-given-size/1


public class Node<T> {
    var value: T
    var nextNode: Node?
    
    init(value: T) {
        self.value = value
    }
    
    func printNode() {
        print(value)
    }
}

public class LinkedList<T> {
  fileprivate var head: Node<T>?
  private var tail: Node<T>?

  public var isEmpty: Bool {
    return head == nil
  }

   var first: Node<T>? {
    return head
  }

   var last: Node<T>? {
    return tail
  }
    
    func append(num: T)  {
        let node = Node<T>(value: num)
        //node.printNode()
        if isEmpty {
            head = node
            tail = node
        } else {
            tail?.nextNode = node
            tail = node
        }
    }
    func reverseListByGroups(head: Node<T>?, k: Int) -> Node<T>? {
        if k <= 1 { return head }
        var newHead = head
        
        var tempHead = head
        var tempTail:Node<T>?
        
        var currentNode = head
        var i = 1
        
        while currentNode != nil {
            if i == k || (currentNode?.nextNode == nil && i > 1) {

                let tmpNode = currentNode?.nextNode
                currentNode?.nextNode = nil
                
                let reversedHead = reverseList(head: tempHead)
                
                if tempTail != nil {
                    tempTail?.nextNode = reversedHead
                    tempTail = tempHead
                    
                } else {
                    newHead = reversedHead
                    
                    tempTail = tempHead
                }
                tempHead?.nextNode = tmpNode
                tempHead = tmpNode
                
                currentNode = tmpNode
                i = 1
            } else {
                i = i + 1
                currentNode = currentNode?.nextNode
            }
        }
        printList(head: newHead)

        return newHead
    }
    
    func reverseList(head: Node<T>?) -> Node<T>? {
        var head = head
        var firstRun = true
        var newHead = head
        head = head?.nextNode
        while head != nil {
            let next = head
            head = head?.nextNode
            if firstRun {
                firstRun = false
                newHead?.nextNode = nil
            }
            next?.nextNode = newHead
            newHead = next
        }
        return newHead
    }
    func printList(head: Node<T>?) {
        var head = head
        while head != nil {
            head?.printNode()
            head = head?.nextNode
        }
    }
}

var list = LinkedList<Int>()
list.append(num: 1)
list.append(num: 2)
list.append(num: 3)
list.append(num: 4)
list.append(num: 5)
//list.append(num: 6)

//list.getMiddle2()
list.reverseListByGroups(head: list.head, k: 3)


