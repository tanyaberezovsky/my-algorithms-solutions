
import Foundation


func addition(a: Int, b: Int) -> Int {
    return a + b
}

func subtraction(a: Int, b: Int) -> Int {
    return a - b
}

func multiply(a: Int, b: Int) -> Int {
    return a * b
}

func division(a: Int, b: Int) -> Int {
    return a / b
}

func calculate(a: Int, b: Int, operation: (Int, Int) -> Int) {
    let result = operation(a, b)
    print(result)
}

calculate(a: 7, b: 2, operation: addition)
calculate(a: 7, b: 2, operation: subtraction)
calculate(a: 7, b: 2, operation: multiply)
calculate(a: 7, b: 2, operation: division)


