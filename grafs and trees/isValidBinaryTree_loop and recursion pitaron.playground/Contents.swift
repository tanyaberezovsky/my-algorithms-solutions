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
        let left = BinaryTreeNode(leftValue)
        self.left = left
        return left
    }

    @discardableResult
    func insert(rightValue: Int) -> BinaryTreeNode {
        let right = BinaryTreeNode(rightValue)
        self.right = right
        return right
    }
}

struct NodeBounds {
    var node: BinaryTreeNode
    var lowerBound: Int
    var upperBound: Int
}

func isBinarySearchTree_loopAproach(_ tree: BinaryTreeNode) -> Bool {

    var nodebounds = [NodeBounds]()

    nodebounds.append(NodeBounds(node: tree, lowerBound: Int.min, upperBound: Int.max))
    while nodebounds.count > 0 {
        let nd = nodebounds.removeLast()
        let value = nd.node.value
        let lowerBound = nd.lowerBound
        let upperBound = nd.upperBound
        print("value \(value) lowerBound \(lowerBound) upperBound \(upperBound)")
        if value <= lowerBound || value >= upperBound {
            print("FALSE")
            return false
        }
        if let left = nd.node.left {
            nodebounds.append(NodeBounds(node: left, lowerBound: lowerBound, upperBound: value))
        }
        if let right = nd.node.right {
            nodebounds.append(NodeBounds(node: right, lowerBound: value, upperBound: upperBound))
        }
    }
    return true
}

func isBinarySearchTree(_ tree: BinaryTreeNode) -> Bool {
    return isBinarySearchTree(tree, lowerBound: Int.min, upperBound: Int.max)
}

func isBinarySearchTree(_ tree: BinaryTreeNode?, lowerBound: Int, upperBound: Int) -> Bool {
    guard let tree = tree else {
        return true
    }
    if tree.value <= lowerBound || tree.value >= upperBound {
        return false
    }
    
    return isBinarySearchTree(tree.left, lowerBound: lowerBound, upperBound: tree.value) && isBinarySearchTree(tree.right, lowerBound: tree.value, upperBound: upperBound)
}
// interview cake approach
//func isBinarySearchTree(_ tree: BinaryTreeNode) -> Bool {
//
//    // start at the root, with an arbitrarily low lower bound
//    // and an arbitrarily high upper bound
//    var nodeAndBoundsStack: [NodeBounds] = []
//    nodeAndBoundsStack.append(NodeBounds(tree, lowerBound: Int.min, upperBound: Int.max))
//
//    // depth-first traversal
//    while !nodeAndBoundsStack.isEmpty {
//        let nb = nodeAndBoundsStack.removeLast()
//        let node = nb.node
//        let lowerBound = nb.lowerBound
//        let upperBound = nb.upperBound
//
//        // if this node is invalid, we return false right away
//        if node.value <= lowerBound || node.value >= upperBound {
//            return false
//        }
//
//        if let left = node.left {
//            // this node must be less than the current node
//            nodeAndBoundsStack.append(NodeBounds(left, lowerBound: lowerBound, upperBound: node.value))
//        }
//        if let right = node.right {
//            // this node must be greater than the current node
//            nodeAndBoundsStack.append(NodeBounds(right, lowerBound: node.value, upperBound: upperBound))
//        }
//    }
//
//    // if none of the nodes were invalid, return true
//    // (at this point we have checked all nodes)
//    return true
//}


import XCTest

class Tests: XCTestCase {

    func testValidFullTree() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 10)
        left.insert(rightValue: 40)
        let right = root.insert(rightValue: 70)
        right.insert(leftValue: 60)
        right.insert(rightValue: 80)

        let result = isBinarySearchTree(root)
        XCTAssertTrue(result)
    }

    func testBothSubtreesValid() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 30)
        left.insert(leftValue: 20)
        left.insert(rightValue: 60)
        let right = root.insert(rightValue: 80)
        right.insert(leftValue: 70)
        right.insert(rightValue: 90)

        let result = isBinarySearchTree(root)
        XCTAssertFalse(result)
    }

    func testDescendingLinkedList() {
        let root = BinaryTreeNode(50)
        let left = root.insert(leftValue: 40)
        let leftLeft = left.insert(leftValue: 30)
        let leftLeftLeft = leftLeft.insert(leftValue: 20)
        leftLeftLeft.insert(leftValue: 10)

        let result = isBinarySearchTree(root)
        XCTAssertTrue(result)
    }

    func testOutOfOrderLinkedList() {
        let root = BinaryTreeNode(50)
        let right = root.insert(leftValue: 70)
        let rightRight = right.insert(leftValue: 60)
        rightRight.insert(leftValue: 80)

        let result = isBinarySearchTree(root)
        XCTAssertFalse(result)
    }

    func testOneNodeTree() {
        let root = BinaryTreeNode(50)

        let result = isBinarySearchTree(root)
        XCTAssertTrue(result)
    }

    static let allTests = [
        ("testValidFullTree", testValidFullTree),
        ("testBothSubtreesValid", testBothSubtreesValid),
        ("testDescendingLinkedList", testDescendingLinkedList),
        ("testOutOfOrderLinkedList", testOutOfOrderLinkedList),
        ("testOneNodeTree", testOneNodeTree)
    ]
}

Tests.defaultTestSuite.run()

//XCTMain([testCase(Tests.allTests)])
