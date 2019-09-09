//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class Node<Element> {
    var value: Element
    var left: Node?
    var right: Node?

    init(value: Element) {
        self.value = value
    }
}

struct BinarySearchTree<Element: Comparable> {
    private(set) var root: Node<Element>

    mutating func insert(_ value: Element, node: Node<Element>?) -> Node<Element> {
        guard let node = node else {
            return Node(value: value)
        }

        if value < node.value {
            node.left = insert(value, node: node.left)
        } else {
            node.right = insert(value, node: node.right)
        }

        return node
    }
}
