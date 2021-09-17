//: [Previous](@previous)

import Foundation

func createZigZag(_ a: [Int]) {
    if a.count == 1 {
        return
    }
    var a = a.sorted()
    
    let mid = a.count / 2
    let tmp = a[a.count - 1]
    a[a.count - 1] = a[mid]
    a[mid] = tmp
    if a.count == 2 {
        print(a)
        return
    }
    var iend = a.count - 2
    var istart = mid + 1
    while istart < iend {
        a.swapAt(istart, iend)
        istart += 1
        iend -= 1
    }
    print(a)
}
createZigZag([2,5])
createZigZag([2,5,7,1,3,9])
createZigZag([2,5,7,1,3,9,4])
