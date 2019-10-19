import UIKit

class Node<T> {
    var value: T
    var next: Node?

    init(value: T, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}

struct Solution<T> {

    var head: Node<T>?

    mutating func append(value: T) {
        head = Node(value: value, next: head)
    }

    mutating func reverselist() ->Node<T>? {
        var currentNode = head
        var prev: Node<T>?
        var next: Node<T>?

        while currentNode != nil {
            next = currentNode?.next
            currentNode?.next = prev
            prev = currentNode
            currentNode = next
        }

        return prev
    }

    mutating func removeAllItemsFromList() {

        var next: Node<T>?

        while head != nil {
            next = head?.next
            head = nil
            print(head?.next)
            head = next
        }
    }
}


extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }

        return "\(value) -> " + String(describing: next) + " "
    }
}

var linkedList = Solution<Int>()
linkedList.append(value: 6)
linkedList.append(value: 5)
linkedList.append(value: 4)
linkedList.append(value: 3)
linkedList.append(value: 6)
linkedList.append(value: 2)
linkedList.append(value: 1)

linkedList.head
linkedList.reverselist()


