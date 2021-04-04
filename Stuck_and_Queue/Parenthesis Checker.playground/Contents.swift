import Foundation

struct Stuck<T> {
    private var stuck: Array<T>? = Array<T>()
    func printStuck() {
        print("stuck count \(stuck?.count ?? 0)")
        stuck?.forEach {
            print($0)
        }
        //print(stuck ?? "empty stuck")
    }
    func isEmpty() -> Bool {
        guard let count = stuck?.count else { return false }
        return count > 0 ? false : true
    }
    
    func pick(i: Int) -> T? {
        return stuck?[i]
    }
    
    mutating func pop() -> T? {
        return stuck?.popLast()
    }
    
    mutating func push(val: T) {
        stuck?.append(val)
    }
}


func isBalanced(str: String) -> String {
    let ret = "not balanced"
    var stuck = Stuck<Character>()
    
    let openess: [Character] = ["[", "{", "("]
    let closeness: [Character] = ["]", "}", ")"]
    
    for char in str {
        if openess.contains(char) {
            stuck.push(val: char)
        } else if closeness.contains(char)  {
            guard let popChar = stuck.pop() else { return ret }
            if isAPair(popChar: popChar, char: char) == false {
                return ret
            }
        }
    }
    if stuck.isEmpty() {
        return "balanced"
    } else {
        return "not balanced"
    }
}

func isAPair(popChar: Character, char: Character) -> Bool {
    if popChar == "{" && char != "}" {
        return false
    } else if popChar == "[" && char != "]" {
        return false
    } else if popChar == "(" && char != ")" {
        return false
    }
    return true
}

isBalanced(str: "[()]{}{[()()]()}")
isBalanced(str: "[(])")
//isBalanced(str: "[()]")
