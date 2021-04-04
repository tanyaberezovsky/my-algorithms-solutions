import Foundation
//https://practice.geeksforgeeks.org/problems/count-leaves-in-binary-tree/1

class Node<T> {
    var data: T
    var left: Node?
    var right: Node?
    init(_ data: T) {
        self.data = data
    }
}

func countLeves(node: Node<Int>?) -> Int {
    
    if node == nil {
        return 0
    }
    if node?.left == nil && node?.right == nil {
        return 1
    }
    return countLeves(node: node?.left) + countLeves(node: node?.right)
}

var root = Node<Int>(4)
root.left = Node<Int>(2)
root.right = Node<Int>(5)
root.left?.left = Node<Int>(1)
root.left?.right = Node<Int>(3)

countLeves(node: root)
