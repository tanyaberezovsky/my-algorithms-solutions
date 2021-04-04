import Foundation
// from c. code interview

class Node<T> {
    var data: T
    var left: Node?
    var right: Node?
    init(_ data: T) {
        self.data = data
    }
}

func DFSPreorderPrint(root: Node<Int>) {
    
    var stack = [Node<Int>]()
    var node:Node<Int>?
  
    stack.append(root)
    
    //Node -> Left -> right
    while !stack.isEmpty {
        node = stack.popLast()
        
        if let data = node?.data {
            print(data) //visit
        }
        
        if let right = node?.right {
            stack.append(right)
        }
        
        if let left = node?.left  {
            stack.append(left)
        }
        
    }
    
}


var root = Node<Int>(1)
root.left = Node<Int>(2)
root.right = Node<Int>(5)
root.left?.left = Node<Int>(3)
root.left?.right = Node<Int>(4)

DFSPreorderPrint(root: root)
