import UIKit

// Problem 998 - Maximum Binary Tree II

/*
 We are given the root node of a maximum tree: a tree where every node has a value greater than any other value in its subtree.
 */

/*
 Input: root = [4,1,3,null,null,2], val = 5
 Output: [5,4,null,1,3,null,null,2]
 Explanation: A = [1,4,2,3], B = [1,4,2,3,5]
 */

public class TreeNode {
    public var val: Int?
    public var left: TreeNode?
    public var right: TreeNode?

    public init(_ val: Int?) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func insertIntoMaxTree(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let rootNode = root else {
            return TreeNode(val)
        }

        if val > rootNode.val ?? 0 {
            let newNode = TreeNode(val)
            newNode.left = root
            return newNode
        } else {
            root?.right = insertIntoMaxTree(root?.right, val)
        }

        return rootNode
    }
}

// TEST DATA
let root = TreeNode(4)
root.left = TreeNode(1)
root.right = TreeNode(3)
root.left = TreeNode(nil)
root.left = TreeNode(nil)
root.right = TreeNode(2)


let solution = Solution()
solution.insertIntoMaxTree(root, 5)
