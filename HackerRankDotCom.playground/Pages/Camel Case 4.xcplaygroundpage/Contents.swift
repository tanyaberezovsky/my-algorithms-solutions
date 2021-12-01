//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func javaCase(input: String) -> String {
    
    if input.split(separator: ";").count < 3 {
        return ""
    }
    
    if isCombine(input) {
        return javaCombine(input)
    } else {
        return javaSplit(input)
    }
}


func javaCombine(_ input: String) -> String {
    
    var names = input.split(separator: ";")[2].split(separator: " ")
    
    var output = String(names[0])
  
    if names.count == 1 {
        return String(names[0])
    }
    
    if isClass(input) {
        output = capitalizingFirstLetter(String(names[0]))
    }
    
    for i in 1 ..< names.count {
        output += capitalizingFirstLetter(String(names[i]))
    }
    
    if isMethod(input) {
        output += "()"
    }
    
    return output
}


func javaSplit(_ input: String) -> String {
    return ""
}


func isCombine(_ input: String) -> Bool {
 
    if input.split(separator: ";")[0] == "C" {
        return true
    }
    return false
}

func isMethod(_ input: String) -> Bool {
 
    if input.split(separator: ";")[1] == "M" {
        return true
    }
    return false
}

func isClass(_ input: String) -> Bool {
 
    if input.split(separator: ";")[1] == "C" {
        return true
    }
    return false
}

func capitalizingFirstLetter(_ str: String) -> String {
    return str.prefix(1).uppercased() + str.lowercased().dropFirst()
}

javaCase(input: "C;V;mobile phone")
javaCase(input: "C;M;mobile phone")
javaCase(input: "C;C;mobile phone")

javaCase(input: "C;V;mobile phone android")
javaCase(input: "C;M;mobile phone android")
javaCase(input: "C;C;mobile phone android")
