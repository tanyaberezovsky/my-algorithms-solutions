import Foundation

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
    func getMiddle() {
        var elementIndex = 0
        var newHead = head
        while newHead != nil {
            print(newHead?.number ?? "")
            newHead = newHead?.nextNode
            elementIndex += 1
        }
        print("index \(elementIndex)")
        if elementIndex % 2 == 0 {
            printElement(index: elementIndex / 2 - 1, isPrintNextElement: true)
        } else {
            printElement(index: elementIndex / 2, isPrintNextElement: false)
        }
    }
    
    func getMiddle2() {
        var mid = head
        var newHead = head
        
        while mid != nil && newHead != nil && newHead?.nextNode != nil {
            newHead = newHead?.nextNode?.nextNode
            mid = mid?.nextNode
        }
        mid?.printNode()
    }
   
    func printElement(index: Int, isPrintNextElement: Bool) {
      var newHead = head
      var elementIndex = 0
      while elementIndex < index {
          newHead = newHead?.nextNode
          elementIndex += 1
      }
        newHead?.printNode()
        if isPrintNextElement {
            newHead = newHead?.nextNode
            newHead?.printNode()
        }
    }
    
    func reverseList(head: Node?) {
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
        printList(head: newHead)
    }
    func printList(head: Node?) {
        var head = head
        while head != nil {
            head?.printNode()
            head = head?.nextNode
        }
    }
}

var list = LinkedList()
list.append(num: 2)
list.append(num: 3)
list.append(num: 4)
list.append(num: 5)
//list.append(num: 6)

//list.getMiddle2()
list.reverseList(head: list.head)
