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

func DFS_PostOrderPrint(root: Node<Int>) {
    
    
    var stack = [Node<Int>]()
    var node:Node<Int>?
    var out = [Int]()
    
    stack.append(root)
    
    //Node -> Left -> right
    while !stack.isEmpty {
        node = stack.popLast()
        
        if let data = node?.data {
            //print(data) //visit
            out.append(data)
        }
        
        if let left = node?.left  {
            stack.append(left)
        }
        
        if let right = node?.right {
            stack.append(right)
        }
        
    }
    
    while !out.isEmpty {
        print(out.popLast() ?? "")
    }
}


var root = Node<Int>(5)
root.left = Node<Int>(3)
root.right = Node<Int>(4)
root.left?.left = Node<Int>(1)
root.left?.right = Node<Int>(2)

DFS_PostOrderPrint(root: root)
