import UIKit

let randomInt = Int.random(in: 0..<6)
let diceRoll = Int(arc4random_uniform(6) + 1)

print(diceRoll)
//h0sahn0.028632778677470605
//        350503105304041532
var str: String = String()
//
//for _ in 0..<18 {
//    let random = "\(Int.random(in: 0..<6))"
//    str.append(contentsOf: random)
//}

print(str)

func cutUpToLastA(url: String) -> String {
    guard let index = url.lastIndex(of: ":") else {
        return ""
    }
    return String(url.prefix(upTo: index))
    
}
//print(cutPort(url: "dfsdf:dfdasf:456"))
