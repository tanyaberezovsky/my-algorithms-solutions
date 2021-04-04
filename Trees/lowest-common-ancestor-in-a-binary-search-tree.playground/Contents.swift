import UIKit

var str = "Hello, playground"
//https://www.geeksforgeeks.org/lowest-common-ancestor-in-a-binary-search-tree/

class Node<T> {
    var data: T
    var left: Node?
    var right: Node?
   init(_ data: T) {
        self.data = data
    }
}

func LCA(root1: Node<Int>?, n1: Int, n2: Int) -> Node<Int>? {
    print("start LCA data \(root1?.data ?? -1)")
    guard let root = root1 else { return root1 }
    var retVal: Node<Int>?
    if (root.data > n1 && root.data > n2) {
        return LCA(root1: root.left, n1: n1, n2: n2)
    }
    if (root.data < n1 && root.data < n2) {
       retVal = LCA(root1: root.right, n1: n1, n2: n2)
       return retVal
    }
    print("return data \(root.data)")
    return root
}



var root = Node<Int>(20)
root.left = Node<Int>(8)
root.right = Node<Int>(22)

root.left?.left = Node<Int>(4)
root.left?.right = Node<Int>(12)

if let ancestor = LCA(root1: root, n1: 4, n2: 12) {
    print("common ancestor is \(ancestor.data)")
}
