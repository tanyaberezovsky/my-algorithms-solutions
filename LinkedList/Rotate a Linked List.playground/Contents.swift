import Foundation
//https://practice.geeksforgeeks.org/problems/rotate-a-linked-list/1

class Node {
    var number: Int
    var nextNode: Node?
    
    init(number: Int) {
        self.number = number
    }
    
    func printNode() {
        print(number)
    }
}

public class LinkedList {
  fileprivate var head: Node?
  private var tail: Node?

  public var isEmpty: Bool {
    return head == nil
  }

   var first: Node? {
    return head
  }

   var last: Node? {
    return tail
  }
    
    func append(num:Int)  {
        let node = Node(number: num)
        //node.printNode()
        if isEmpty {
            head = node
            tail = node
        } else {
            tail?.nextNode = node
            tail = node
        }
    }
  
    
    func rotateList(head: Node?, k: Int) -> Node?{
        var newHead = head
        var node = head
        let oldHead = head
        var i = 1
       
        while node?.nextNode != nil {
            if i == k {
                print("i = \(i)")
                newHead = node?.nextNode
                node?.nextNode = nil
                printList(head: oldHead)
                node = newHead
            }
            node = node?.nextNode
            i = i + 1
            
        }
        if i > k {
            node?.nextNode = oldHead
        }
        
        printList(head: newHead)
        return newHead
        
    }
    func printList(head: Node?) {
        print("------------------------")
        var head = head
        while head != nil {
            head?.printNode()
            head = head?.nextNode
        }
        print("------------------------")
    }
}

var list = LinkedList()
list.append(num: 1)
list.append(num: 2)
list.append(num: 3)
list.append(num: 4)
list.append(num: 5)

var newHead = list.rotateList(head: list.head, k: 2)
newHead?.printNode()
//list.rotateList(head: list.head, k: 5)
