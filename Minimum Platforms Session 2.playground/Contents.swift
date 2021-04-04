import Foundation

func findPlatform(arr:[Int], dep:[Int]) -> Int {
    if arr.count < 2 { return arr.count }
    let arr = arr.sorted()
    let dep = dep.sorted()
    var maxPlatforms = 1
    var currPlatforms = 1
    var lastDep = dep[0]
    for i in 1 ..< arr.count {
        if lastDep > arr[i] {
            currPlatforms += 1
            maxPlatforms = max(maxPlatforms, currPlatforms)
        } else {
            currPlatforms -= 1
            lastDep = dep[i]
        }
    }
    print(maxPlatforms)
    return maxPlatforms
}

findPlatform(arr: [900, 930, 1015], dep: [1000,1030,1045])
