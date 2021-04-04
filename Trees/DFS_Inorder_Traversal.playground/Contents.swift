import Foundation
//https://leetcode.com/problems/binary-tree-inorder-traversal/solution/

class Node<T> {
    var data: T
    var left: Node?
    var right: Node?
    init(_ data: T) {
        self.data = data
    }
}

func DFSInorderPrint(root: Node<Int>) {
    
    var stack: [Node<Int>] = [Node<Int>]()
    var curr: Node<Int>? = root
    
    while !stack.isEmpty || curr != nil {
        while let current = curr {
            stack.append(current)
            curr = curr?.left
        }
        curr = stack.popLast()
        //visit
        print(curr?.data ?? "00")
        
        curr = curr?.right
    }
}

var root = Node<Int>(4)
root.left = Node<Int>(2)
root.right = Node<Int>(5)
root.left?.left = Node<Int>(1)
root.left?.right = Node<Int>(3)

DFSInorderPrint(root: root)
