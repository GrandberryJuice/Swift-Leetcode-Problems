import UIKit


//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


class Tree {
    var root: TreeNode?

    init(){}

    func insert(value: Int) {
        root = insert(from: root, value: value)
    }

    func insert(from node: TreeNode?, value: Int) -> TreeNode {
        guard let root = node else { return  TreeNode(value) }

        if value < root.val {
            root.left = insert(from: root.left, value: value)
        } else {
            root.right = insert(from: root.right, value: value)
        }

        return root
    }

    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        var sum = 0
        guard let node = root else { return sum }

        print("This was sum each time \(node.val)")

        if L <= node.val &&  node.val <= R {
            sum += node.val
        }

        if L < node.val {
            sum = sum + rangeSumBST(node.left, L, R)
            print("The call stack on the left side \(sum)")
        }

        if node.val < R {
            sum = sum + rangeSumBST(node.right, L, R)
            print("The call stack on the right side \(sum)")
        }

        return sum
    }
}

// [10, 5, 15, 3, 7, null, 18]
let tree = Tree()


tree.insert(value: 10)
tree.insert(value: 5)
tree.insert(value: 15)
tree.insert(value: 3)
tree.insert(value: 7)
tree.insert(value: 18)

var root = tree.root

tree.rangeSumBST(root, 7, 15)
