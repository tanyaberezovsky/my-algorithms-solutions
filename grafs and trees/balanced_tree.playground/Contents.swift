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
struct TreeLevel {
    var level: Int
    var node: BinaryTreeNode
}
func isBalanced(treeRoot: BinaryTreeNode) -> Bool {
    var level = 0
    var maxLevel = 0
    var minLevel = -1
    var nodes: [TreeLevel] = [TreeLevel(level: level, node: treeRoot)]
    var node: TreeLevel
    while nodes.count > 0 {
        level += 1
        node = nodes.removeLast()
        if isLeaf(node: node.node) {
            maxLevel = max(maxLevel, level)
            if minLevel == -1 {
                minLevel = level
            } else {
                minLevel = min(minLevel, level)
            }
            if (maxLevel - minLevel) > 1 {
                return false
            }
            level -= 1
            
        } else {
            if let right = node.node.right {
                nodes.append(TreeLevel(level: level, node: right))
            }
            if let left = node.node.left {
                nodes.append(TreeLevel(level: level, node: left))
            }
        }
    }
   return true
}

func isLeaf(node: BinaryTreeNode) -> Bool {
    if node.right == nil && node.left == nil {
        return true
    }
    return false
}















// tests

import XCTest

class Tests: XCTestCase {

    func testFullTree() {
        let treeRoot = BinaryTreeNode(5)
        let leftNode = treeRoot.insert(leftValue: 8)
        leftNode.insert(leftValue: 1)
        leftNode.insert(rightValue: 2)
        let rightNode = treeRoot.insert(rightValue: 6)
        rightNode.insert(leftValue: 3)
        rightNode.insert(rightValue: 4)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    func testBothLeavesAtTheSameDepth() {
        let treeRoot = BinaryTreeNode(3)
        let leftNode = treeRoot.insert(leftValue: 4)
        leftNode.insert(leftValue: 1)
        let rightNode = treeRoot.insert(rightValue: 2)
        rightNode.insert(rightValue: 9)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    func testLeafHeightsDifferByOne() {
        let treeRoot = BinaryTreeNode(6)
        treeRoot.insert(leftValue: 1)
        let rightNode = treeRoot.insert(rightValue: 0)
        rightNode.insert(rightValue: 7)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    func testLeafHeightsDifferByTwo() {
        let treeRoot = BinaryTreeNode(6)
        treeRoot.insert(leftValue: 1)
        let rightNode = treeRoot.insert(rightValue: 0)
        rightNode.insert(rightValue: 7).insert(rightValue: 8)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertFalse(result)
    }

    func testThreeLeavesTotal() {
        let treeRoot = BinaryTreeNode(1)
        treeRoot.insert(leftValue: 5)
        let rightNode = treeRoot.insert(rightValue: 9)
        rightNode.insert(leftValue: 8)
        rightNode.insert(rightValue: 5)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    func testBothSubtreesSuperBalanced() {
        let treeRoot = BinaryTreeNode(1)
        treeRoot.insert(leftValue: 5)
        let rightNode = treeRoot.insert(rightValue: 9)
        rightNode.insert(leftValue: 8).insert(leftValue: 7)
        rightNode.insert(rightValue: 5)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertFalse(result)
    }

    func testBothSubtreesSuperBalancedTwo() {
        let treeRoot = BinaryTreeNode(1)
        let leftNode = treeRoot.insert(leftValue: 2)
        leftNode.insert(leftValue: 3)
        leftNode.insert(rightValue: 7).insert(rightValue: 8)
        let rightNode = treeRoot.insert(rightValue: 4)
        rightNode.insert(rightValue: 5).insert(rightValue: 6).insert(rightValue: 9)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertFalse(result)
    }

    func testOnlyOneNode() {
        let treeRoot = BinaryTreeNode(1)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    func testLinkedListTree() {
        let treeRoot = BinaryTreeNode(1)
        treeRoot.insert(rightValue: 2).insert(rightValue: 3).insert(rightValue: 4)

        let result = isBalanced(treeRoot: treeRoot)
        XCTAssertTrue(result)
    }

    static let allTests = [
        ("testFullTree", testFullTree),
        ("testBothLeavesAtTheSameDepth", testBothLeavesAtTheSameDepth),
        ("testLeafHeightsDifferByOne", testLeafHeightsDifferByOne),
        ("testLeafHeightsDifferByTwo", testLeafHeightsDifferByTwo),
        ("testThreeLeavesTotal", testThreeLeavesTotal),
        ("testBothSubtreesSuperBalanced", testBothSubtreesSuperBalanced),
        ("testBothSubtreesSuperBalancedTwo", testBothSubtreesSuperBalancedTwo),
        ("testOnlyOneNode", testOnlyOneNode),
        ("testLinkedListTree", testLinkedListTree)
    ]
}

Tests.defaultTestSuite.run()
