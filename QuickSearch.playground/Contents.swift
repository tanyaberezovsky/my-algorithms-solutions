import UIKit


func quickSort( _ arr: inout [Int], low: Int, high: Int) -> [Int] {
    print("arr = \(arr) low = \(low) high = \(high)")
    if low >= high {
        return arr
    }
    let pivot = arr[ arr.count / 2 - 1 ]
    var lowArr = arr.filter{ $0 < pivot }
    var highArr = arr.filter{ $0 > pivot }
    var pivotArr = arr.filter{ $0 == pivot }
    return quickSort(&lowArr, low: 0, high: lowArr.count - 1) + pivotArr + quickSort(&highArr, low: 0, high: highArr.count - 1)
}

var arr = [25, 787, 0, 88, 13, 11, 4, 55]
print(quickSort(&arr, low: 0, high: arr.count - 1))

