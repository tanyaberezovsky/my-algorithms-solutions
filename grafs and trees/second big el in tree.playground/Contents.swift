import Foundation

let x: NSString = "some+other@host.xxx"
extension String {
    func stringByAddingPercentEncodingForRFC3986() -> String? {
        let unreserved = "-._~/?:@"
        let allowed = NSMutableCharacterSet.alphanumeric()
        allowed.addCharacters(in: unreserved)
        return self.addingPercentEncoding( withAllowedCharacters: allowed as CharacterSet) //stringByAddingPercentEncodingWithAllowedCharacters(allowed)
    }
    
    
    func stringByAddingPercentEncodingForRFC3986_2() -> String {
           var characterSet = CharacterSet.urlQueryAllowed
           characterSet.insert(charactersIn: "?&+")
        var output: String = ""
               if let ret = self.addingPercentEncoding( withAllowedCharacters: characterSet as CharacterSet){
                   output = ret
               }
               return output
    }

}
//And then to use it:

let query = "some+other@host.xxx"
let encoded = query.stringByAddingPercentEncodingForRFC3986_2()
print(encoded)


class BinaryTreeNode {

    var value: Int
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    init(_ value: Int) {
        self.value = value
    }

    @discardableResult
    func insert(leftValue: Int) -> BinaryTreeNode {
        left = BinaryTreeNode(leftValue)
        return left!
    }

    @discardableResult
    func insert(rightValue: Int) -> BinaryTreeNode {
        right = BinaryTreeNode(rightValue)
        return right!
    }
}
struct SeconLargestElement {
    
}
func findSecondLargestValue(startingFrom node: BinaryTreeNode) throws -> Int {
    // find the second largest item in the binary search tree
    return try findSecondLargestValue(startingFrom: node, secondLargesVal: node.value)
}


func findSecondLargestValue(startingFrom node: BinaryTreeNode?, secondLargesVal: Int?, isLeft: Bool = false) throws -> Int {
    
    if node?.right == nil && node?.left == nil {
        return secondLargesVal == nil ? 0 : secondLargesVal!
    }
    
    if node?.right != nil {
        return try findSecondLargestValue(startingFrom: node?.right, secondLargesVal: node?.value, isLeft: false)
    } else {
        return try  findSecondLargestValue(startingFrom: node?.left, secondLargesVal: secondLargesVal, isLeft: true)
    }
}
 
/*

 func findSecondLargestValue(startingFrom node: BinaryTreeNode, secondLargesVal: Int, isLeft: Bool = false) throws -> Int {
     
     if node.right == nil && node.left == nil {
         return secondLargesVal
     }
     
     if let right = node.right {
         return try findSecondLargestValue(startingFrom: right, secondLargesVal: node.value)
     } else if let left = node.left {
         return try findSecondLargestValue(startingFrom: left, secondLargesVal: left.value, isLeft: true)
     }
     //return secondLargesVal
 }


 */














// tests

import XCTest

class Tests: XCTestCase {

    func testFullTree() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 10)
        left.insert(rightValue: 40)
        let right = root.insert(rightValue: 70)
        right.insert(leftValue: 60)
        right.insert(rightValue: 80)

        let actual = try? findSecondLargestValue(startingFrom: root)
        let expected = 70
        XCTAssertEqual(actual, expected)
    }

    func testLargestHasALeftChild() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 10)
        left.insert(rightValue: 40)
        let right = root.insert(rightValue: 70)
        right.insert(leftValue: 60)

        let actual = try? findSecondLargestValue(startingFrom: root)
        let expected = 60
        XCTAssertEqual(actual, expected)
    }

    func testLargestHasALeftSubtree() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 10)
        left.insert(rightValue: 40)
        let right = root.insert(rightValue: 70)
        let rightLeft = right.insert(leftValue: 60)
        rightLeft.insert(leftValue: 55).insert(rightValue: 58)
        rightLeft.insert(rightValue: 65)

        let actual = try? findSecondLargestValue(startingFrom: root)
        let expected = 65
        XCTAssertEqual(actual, expected)
    }

    func testSecondLargestIsRootNode() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 10)
        left.insert(rightValue: 40)
        root.insert(rightValue: 70)

        let actual = try? findSecondLargestValue(startingFrom: root)
        let expected = 50
        XCTAssertEqual(actual, expected)
    }

    func testDescendingLinkedList() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 40)
        left.insert(leftValue: 30).insert(leftValue: 20).insert(leftValue: 10)

        let actual = try? findSecondLargestValue(startingFrom: root)
        let expected = 40
        XCTAssertEqual(actual, expected)
    }

    func testAscendingLinkedList() {
        let root = BinaryTreeNode(50)
        let right = root.insert(rightValue: 60)
        right.insert(rightValue: 70).insert(rightValue: 80)

        let actual = try? findSecondLargestValue(startingFrom: root)
        let expected = 70
        XCTAssertEqual(actual, expected)
    }

    func testThrowsErrorWhenTreeHasOneNode() {
        let root = BinaryTreeNode(50)

        let result = try? findSecondLargestValue(startingFrom: root)
        XCTAssertNil(result)
    }

//    static let allTests = [
//        ("testFullTree", testFullTree),
//        ("testLargestHasALeftChild", testLargestHasALeftChild),
//        ("testLargestHasALeftSubtree", testLargestHasALeftSubtree),
//        ("testSecondLargestIsRootNode", testSecondLargestIsRootNode),
//        ("testDescendingLinkedList", testDescendingLinkedList),
//        ("testAscendingLinkedList", testAscendingLinkedList),
//        ("testThrowsErrorWhenTreeHasOneNode", testThrowsErrorWhenTreeHasOneNode)
 //   ]
}

Tests.defaultTestSuite.run()
