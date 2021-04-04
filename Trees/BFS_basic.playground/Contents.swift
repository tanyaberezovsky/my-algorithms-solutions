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

func BFSprint(root: Node<Int>) {
    
    var q = [Node<Int>]()
    q.append(root)
    
    while !q.isEmpty {
        let node = q.remove(at: 0)
        
        print(node.data) //visit
        if let left = node.left {
            q.append(left)
        }
        
        if let right = node.right {
            q.append(right)
        }
    }
}


func BFSerch(root: Node<Int>, find: Int) {
    
    var q = [Node<Int>]()
    q.append(root)
    
    while !q.isEmpty {
        var node = q.remove(at: 0)
         //visit
        if node.data == find {
            print("node found!")
            return
        }
        if let left = node.left {
            q.append(left)
        }
        
        if let right = node.right {
            q.append(right)
        }
    }
    print("node DO NOT found!")
}


func BFSprintMostLeft(root: Node<Int>) {
    
    var q = [Node<Int>]()
    q.append(root)
    
    while !q.isEmpty {
        
        for  i in 1 ..< q.count+1 {
            let node = q.remove(at: 0)
            //visit
            if i == 1 {
                print(node.data)
            }
            if let left = node.left {
                q.append(left)
            }
            
            if let right = node.right {
                q.append(right)
            }
        }
        
    }
}


var root = Node<Int>(1)
root.left = Node<Int>(2)
root.right = Node<Int>(3)
root.left?.left = Node<Int>(4)
root.left?.right = Node<Int>(5)
root.right?.left = Node<Int>(6)
root.right?.right = Node<Int>(7)
root.left?.left?.left = Node<Int>(8)

BFSprint(root: root)
BFSerch(root: root, find: 3)
BFSerch(root: root, find: 34)

BFSprintMostLeft(root: root)
