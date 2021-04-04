import Foundation

struct MinHeap {
    var heap = [Int]()
    
    mutating func add(num: Int) {
        heap.insert(num, at: heap.count)
        
        var i = heap.count - 1
        while i > 0  {
            let p = parent(i)
            if heap[i] < heap[p] {
                self.swap(i, p)
                i = p
            } else {
                break
            }
        }
    }
    
    mutating private func swap(_ i: Int, _ j: Int) {
        let tmp = heap[i]
        heap[i] = heap[j]
        heap[j] = tmp
    }
    func parent(_ i: Int) -> Int {
        return i/2
    }
    
    func left(_ i: Int) -> Int {
        return 2*i
    }
    func right(_ i: Int) -> Int {
        return 2*i+1
    }
 
    func getMinByIndex(i: Int) {
        while i > 0 {
            if i % 2 == 0 {
                
            }
        }
    }
}

//7 10 4 3 20 15
var minHeap = MinHeap()
minHeap.add(num: 7)
minHeap.add(num: 10)
minHeap.add(num: 4)
minHeap.add(num: 3)
minHeap.add(num: 20)
minHeap.add(num: 15)

print(minHeap.heap)
print(minHeap.left(3))
print(minHeap.right(3))

