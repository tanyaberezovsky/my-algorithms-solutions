//: [Previous](@previous)

import Foundation


func palindromeIndex(s: String) -> Int {
    print(s)
    if s == String(s.reversed()) {
        return -1
    }
    let arr = Array(s)
   
    var st = 0
    var en = arr.count - 1
    var indexPer = -1
    while st < en {
        if arr[st] == arr[en] {
            st += 1
            en -= 1
        } else {
            if st + 1 < en && arr[st + 1] == arr[en] {
                indexPer = st
                st += 1
            } else if en - 1 >= st && arr[st] == arr[en - 1] {
                indexPer = en
                en -= 1
            } else {
                return -1
            }
        }
    }
    return indexPer
}

palindromeIndex(s:"aaab")
palindromeIndex(s:"baa")
palindromeIndex(s:"aaa")
palindromeIndex(s:"uyjjdcgsvvsgcdjjy")
palindromeIndex(s:"yjpjdcgsvwvsgcdjjy")

