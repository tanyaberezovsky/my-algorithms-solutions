//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



protocol Color {
    var color: UIColor { get }
}

final class MyColor: MyColor.color {
    typealias color = Color
    var color: UIColor = {
        return UIColor.green
    }()
}

struct Ball {
    var ballColor: MyColor.color = {
        return MyColor()
    }()
}

print(Ball.init().ballColor.color)
