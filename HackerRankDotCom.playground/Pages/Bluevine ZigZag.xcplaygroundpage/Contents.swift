//: [Previous](@previous)

import Foundation
/*
 bar shaj -
   testing
   
   sprints
   
   5 devs 1 lead
   teach
   lead

 */

func zigzag(arr: [Int]) {
  
  if arr.count <= 2 {
    print(arr)
    return
  }
  
  var arr = arr.sorted()
  
  var curIndex = 1
  let endIndex = arr.count - 1
  
  while curIndex <= endIndex / 2 + 1 {
  
    arr.insert(arr.remove(at: endIndex), at: curIndex)

    curIndex += 2
  }
  
  print(arr)
}

zigzag(arr: [1,2,5,4,3,6])//... [1, 6, 2, 5, 3, 4]

zigzag(arr: [1,2,3,4])//... [1, 4, 2, 3]
