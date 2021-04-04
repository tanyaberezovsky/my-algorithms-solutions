import Foundation
//https://www.geeksforgeeks.org/counting-inversions/
// Working copy of merge sort
//func mergeSort(_ arr:[Int]) -> [Int] {
//    guard arr.count > 1 else { return arr }
//
//    print("arr \(arr)")
//
//    let m  = (arr.count ) / 2 //middle
//    let leftArr = mergeSort(Array(arr[0 ..< m]))
//    let rightArr = mergeSort(Array(arr[m ..< arr.count]))
//    print("leftArr \(leftArr) rightArr \(rightArr) ")
//
//    return merge(leftArr, rightArr)
//}
//
//func merge(_ lArr: [Int], _ rArr: [Int]) -> [Int] {
//    var i = 0, j = 0
//    var newArr = [Int]()
//    while i < lArr.count && j < rArr.count {
//        if lArr[i] < rArr[j] {
//            newArr.append(lArr[i])
//            i = i + 1
//        } else {
//            newArr.append(rArr[j])
//            j = j + 1
//        }
//    }
//    if i < lArr.count {
//        newArr = newArr + lArr[i ..< lArr.count]
//    }
//    if j < rArr.count {
//        newArr = newArr + rArr[j ..< rArr.count]
//    }
//    return newArr
//}
//
//let arr = [8,4,6,1]
//print(mergeSort(arr))
//

var inversion = 0
func mergeSort(_ arr:[Int]) -> [Int] {
    guard arr.count > 1 else { return arr }

    print("arr \(arr)")

    let m  = (arr.count ) / 2 //middle
    let leftArr = mergeSort(Array(arr[0 ..< m]))
    let rightArr = mergeSort(Array(arr[m ..< arr.count]))
    print("leftArr \(leftArr) rightArr \(rightArr) ")

    return merge(leftArr, rightArr)
}

func merge(_ lArr: [Int], _ rArr: [Int]) -> [Int] {
    var i = 0, j = 0
    var newArr = [Int]()
    while i < lArr.count && j < rArr.count {
        if lArr[i] < rArr[j] {
            newArr.append(lArr[i])
            i = i + 1
        } else {
            newArr.append(rArr[j])
            j = j + 1
            inversion = inversion +  lArr.count - i
        }
    }
    if i < lArr.count {
        newArr = newArr + lArr[i ..< lArr.count]
    }
    if j < rArr.count {
        newArr = newArr + rArr[j ..< rArr.count]
    }
    return newArr
}

//let arr = [8,4,6,1]
let arr = [2,4,1,3,5]
print(mergeSort(arr))
print(inversion)
