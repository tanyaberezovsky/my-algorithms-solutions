import Foundation
//ctci p. 521
//https://practice.geeksforgeeks.org/problems/lru-cache/1

struct LRUCache {
    private var maxCacheSize: Int
    private var map = [Int: Node]()
    private var head: Node?
    private var tail: Node?
    private class Node {
        var key: Int
        var val: Int
        var next: Node?
        var prev: Node?
        init(key:Int,val:Int) {
            self.key = key
            self.val = val
        }
    }
    
    init(maxCacheSize: Int) {
        self.maxCacheSize = maxCacheSize
    }
    
    func get(key: Int) -> Int? {
        guard let node = map[key] else { return nil }
        var val = node.val
        //move node forward
        //detached node from linked list
        return val
    }
    private func detacheNodeFromLinkedList(node: Node) {
        if node.prev != nil { node.prev?.next = node.next }
        if node.next != nil { node.next?.prev = node.prev }
        
    }
    func set(key:Int, val:Int) {
        
    }
}
