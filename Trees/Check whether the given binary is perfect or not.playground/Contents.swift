import Foundation


class Node<T> {
    var data: T
    var left: Node<T>?
    var right: Node<T>?
    init(_ data: T) {
        self.data = data
    }
}

func depthOfTree(node: Node<Int>?) -> Int {
    var node: Node<Int>? = node
    var count = 0
    while node != nil {
        node = node?.left
        count += 1
    }
    return count
}

func isTreePerfect(node: Node<Int>?, level: Int, depth: Int) -> Bool {
    if node?.left == nil && node?.right == nil {
        return (depth == level + 1)
    }
    if node?.left == nil || node?.right == nil {
        return false
    }
    
    return isTreePerfect(node: node?.left, level: level + 1, depth: depth) && isTreePerfect(node: node?.right, level: level + 1, depth: depth)
}

func isPerfect(node: Node<Int>?) -> Bool {
    if node == nil { return true }
    let depth = depthOfTree(node: node)
    print("depth = \(depth)")
    
    return isTreePerfect(node: node, level: 0, depth: depth)
}



var root = Node<Int>(4)
root.left = Node<Int>(2)
root.right = Node<Int>(5)
root.left?.left = Node<Int>(1)
root.left?.right = Node<Int>(3)
root.right?.left = Node<Int>(12)
root.right?.right = Node<Int>(32)
isPerfect(node: root)
