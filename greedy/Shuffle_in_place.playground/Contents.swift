// Code run in our editor is compiled with Swift for Linux

import Foundation

#if os(Linux)
srandom(UInt32(time(nil)))
#endif

func getRandom(floor: Int, ceiling: Int) -> Int {
    #if os(Linux)
    return floor + random() % (ceiling - floor + 1)
    #else
    return floor + Int(arc4random_uniform(UInt32(ceiling - floor) + 1))
    #endif
}

func shuffle(array: inout [Int]) {
    
    var j,tmp: Int
    // shuffle the input in place
    for i in (1..<array.count).reversed() {
        print("\(i)")
        j = getRandom(floor: 0, ceiling: i - 1)
        if j == i {
            continue
        }
        tmp = array[i]
        array[i] = array[j]
        array[j] = tmp
    }
    
}

var sampleArray = [1, 2, 3, 4, 5]
print("Sample array:")
print(sampleArray)

print("Shuffling sample array...")
shuffle(array: &sampleArray)
print(sampleArray)
