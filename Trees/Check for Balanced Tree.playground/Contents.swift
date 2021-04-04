import Foundation


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
    }
    
    let depthleft = getMaxDepth(node: node?.left) + 1
    let depthright = getMaxDepth(node: node?.right) + 1
        
    return max(depthleft, depthright)
}

func getMinDepth(node: Node<Int>?) -> Int {
    if node == nil {
        return 0
    }
    
    let depthleft = getMaxDepth(node: node?.left) + 1
    let depthright = getMaxDepth(node: node?.right) + 1
        
    return min(depthleft, depthright)
}

func isBalanced(node: Node<Int>) -> Bool {
//    let max = getMaxDepth(node: node)
//    print("max = \(max)")
//    let min = getMinDepth(node: node)
//    print("min \(min)")
    if (node.left == nil || node.right == nil) {
        return false
    }
    return abs(getMaxDepth(node: node.left) - getMaxDepth(node: node.right)) > 1 ? false : true
}
/*
5
/ \
2  4
   \
    1
 */
var root = Node<Int>(4)
root.left = Node<Int>(2)
root.right = Node<Int>(5)

root.left?.left = Node<Int>(1)
root.left?.right = Node<Int>(3)
//root.left?.right?.right = Node<Int>(13)

//root.right?.left = Node<Int>(12)
//root.right?.right = Node<Int>(32)
//root.right?.right = Node<Int>(32)

isBalanced(node: root)
