//https://afteracademy.com/blog/check-if-a-binary-tree-is-BST-or-not
import Foundation


class Node<T> {
    var data: T
    var left: Node?
    var right: Node?
    init(_ data: T) {
        self.data = data
    }
}


func checkBST(node: Node<Int>) -> Bool {

    var arr = [Int]()
    storeInOrder(node, &arr)
    print(arr)
    
    for i in 1 ..< arr.count {
        if arr[i - 1] > arr[i] {
            return false
        }
    }
    return true
}

func storeInOrder(_ node: Node<Int>?, _ arr: inout [Int]) {
    //var arr = arr
    if node == nil {
        return
    }
    storeInOrder(node?.left, &arr)
    //visit
    if let data = node?.data {
        arr.append(data)
    }
    storeInOrder(node?.right, &arr)
}


func storeInOrderTraverce(_ node: Node<Int>, _ arr: [Int]) {
    var arr = arr
    var stuck = [Node<Int>]()
    stuck.append(node)
    var node: Node<Int>? = node
    
    while !stuck.isEmpty {
        while node != nil {
            if let left = node?.left {
                stuck.append(left)
            }
            node = node?.left
        }
        
    }
    
    
    if node == nil {
        return
    }
    storeInOrder(node?.left, &arr)
    //visit
    if let data = node?.data {
        arr.append(data)
    }
    storeInOrder(node?.right, &arr)
}



var root = Node<Int>(4)
root.left = Node<Int>(2)
root.right = Node<Int>(5)
root.left?.left = Node<Int>(1)
root.left?.right = Node<Int>(3)

checkBST(node: root)
