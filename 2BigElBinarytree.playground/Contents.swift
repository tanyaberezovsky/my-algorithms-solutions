import Foundation
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
enum BinaryTreeError: Error {
    case treeHasNotHave2BigElement
}
func findSecondLargestValue(startingFrom node: BinaryTreeNode) throws -> Int {
    
//    if node.right == nil
//    {
//        print(" node.right == nil")
//        throw BinaryTreeError.treeHasNotHave2BigElement
//    }
    
//    if let val = node.right?.value, node.right?.right == nil
//    {
//        print("node.right?.right == nil")
//        if let left = node.right?.left {
//               return findLargestNode(startingFrom: left).value
//           } else {
//                return val
//           }
//
//    }
    // find the second largest item in the binary search tree
    let parentNode = findLargestParentNode(startingFrom: node)
    print("largest parent node value \(parentNode.value)")
    if let left = parentNode.right?.left {
        return findLargestNode(startingFrom: left).value
    } else {
        if let val = node.right?.value, node.right?.right == nil {
            return val
        }
        return parentNode.value
    }
}


func findLargestParentNode(startingFrom node: BinaryTreeNode) -> BinaryTreeNode {
    
    if let right = node.right, node.right?.right != nil {
        return findLargestParentNode(startingFrom: right)
    }
    return node
}



func findLargestNode(startingFrom node: BinaryTreeNode) -> BinaryTreeNode {
    if let right = node.right {
        return findLargestNode(startingFrom: right)
    }
    return node
}
















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

    static let allTests = [
        ("testFullTree", testFullTree),
        ("testLargestHasALeftChild", testLargestHasALeftChild),
        ("testLargestHasALeftSubtree", testLargestHasALeftSubtree),
        ("testSecondLargestIsRootNode", testSecondLargestIsRootNode),
        ("testDescendingLinkedList", testDescendingLinkedList),
        ("testAscendingLinkedList", testAscendingLinkedList),
        ("testThrowsErrorWhenTreeHasOneNode", testThrowsErrorWhenTreeHasOneNode)
    ]
}

//XCTMain([testCase(Tests.allTests)])
Tests.defaultTestSuite.run()
