import UIKit

var str = "Hello, playground"

protocol ICar {
    func getPrice()
    func getPriceWithDiscount()
}

struct Car {
    
}

extension Car: ICar {
    func getPrice() {
        
    }
    func getPriceWithDiscount() {
        
    }
}
