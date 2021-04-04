import Foundation
//https://practice.geeksforgeeks.org/problems/intersection-point-in-y-shapped-linked-lists/1/


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
  var head: Node<T>?
  private var tail: Node<T>?
  fileprivate var count: Int = 0
    
  public var isEmpty: Bool {
    return head == nil
  }

   var first: Node<T>? {
    return head
  }

   var last: Node<T>? {
    return tail
  }
    var countNodes: Int {
        return count
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
        count = count + 1
    }
  
    func append(node: Node<T>?)  {
          //node.printNode()
          if isEmpty {
              head = node
              tail = node
          } else {
              tail?.nextNode = node
              tail = node
          }
          count = count + 1
      }
    
    func printList(head: Node<T>?) {
        var head = head
        while head != nil {
            head?.printNode()
            head = head?.nextNode
        }
    }
}

func findIntersectionNode<T>(list1: LinkedList<T> , list2: LinkedList<T> ) -> Int {
    let len1 = list1.countNodes
    let len2 = list2.countNodes
    if len1 > len2 {
        return innerFindIntersectionNode(diffCount: len1 - len2, longList: list1.head, shortList: list2.head)
    } else {
        return innerFindIntersectionNode(diffCount: len2 - len1, longList: list2.head, shortList: list1.head)
    }
}

func innerFindIntersectionNode<T>(diffCount: Int,longList list1: Node<T>? , shortList list2: Node<T>? ) -> Int {
    guard var _ = list1, var _ = list2 else { return -1 }
    var head1 = list1
    var head2 = list2
    var diffCount = diffCount
    while diffCount > 0 {
        head1 = head1?.nextNode
        diffCount = diffCount - 1
    }
    while head1 != nil {
        if head1 === head2 {
            guard let val = head1?.value as? Int else { return -1 }
            return val
        }
        head1 = head1?.nextNode
        head2 = head2?.nextNode
    }
    return -1
}

var list = LinkedList<Int>()
list.append(num: 1)
list.append(num: 2)
list.append(num: 3)

var tail = LinkedList<Int>()
tail.append(num: 4)
tail.append(num: 5)
list.append(node: tail.head)

var list2 = LinkedList<Int>()
list2.append(num: 10)

list2.append(node: tail.head)

var output:Int
output = findIntersectionNode(list1: list, list2: list2)
print(output)
output = findIntersectionNode(list1: list2, list2: list)
print(output)

