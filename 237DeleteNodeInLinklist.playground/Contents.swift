import UIKit

class Node {
    var val: Int
    var next: Node?

    init(val: Int, next: Node? = nil) {
        self.val = val
        self.next = next
    }
}


struct Solution {
    var head: Node?

    mutating func deleteNodeFromList(node: Node) {
        guard var headNode = head else { return }

        var prev = headNode

        while head != nil {
            if node.val == headNode.val {
                prev = headNode.next!
            }

            prev = headNode
            headNode = headNode.next!
        }
    }
}
