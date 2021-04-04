import Foundation
//https://www.geeksforgeeks.org/print-left-view-binary-tree/

class Node<T> {
    var data: T
    var left: Node<T>?
    var right: Node<T>?
    init(_ data: T) {
        self.data = data
    }
}

func leftView(root: Node<Int>) {
    
}

var tree = Node<Int>(12)
tree.left =  Node<Int>(10)
tree.right =  Node<Int>(30)
tree.right?.left =  Node<Int>(25)
tree.right?.right =  Node<Int>(40)

