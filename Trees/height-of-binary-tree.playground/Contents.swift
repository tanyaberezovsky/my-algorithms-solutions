import Foundation
//https://practice.geeksforgeeks.org/problems/height-of-binary-tree/1

class Node<T> {
    var data: T
    var left: Node<T>?
    var right: Node<T>?
    init(_ data: T) {
        self.data = data
    }
}


func getMaxDepth(node: Node<Int>?) -> Int {
    if node == nil {
        return 0
    } else {
        let ldepth = getMaxDepth(node: node?.left)
        let rdepth = getMaxDepth(node: node?.right)
        
        if ldepth > rdepth {
            return ldepth + 1
        } else {
            return rdepth + 1
        }
    }
    
}

func getHeight(node: Node<Int>?) -> Int {
    if node == nil {return 0}
    return getMaxDepth(node: node) 
}

var root = Node<Int>(4)
root.left = Node<Int>(2)
root.right = Node<Int>(5)

root.left?.left = Node<Int>(1)
root.left?.right = Node<Int>(3)

root.right?.left = Node<Int>(12)
root.right?.right = Node<Int>(32)
//root.right?.right = Node<Int>(32)

getHeight(node: root)
