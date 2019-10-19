import UIKit

// There are two solutions
// The first solution is using generics and much cleaner
// The second solution works in leetcode ide

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

    mutating func removeElements(_ val: Int) -> Node<T>? {
        var prev: Node<T>?
        var next: Node<T>?

        while head != nil {
            if head!.value as! Int == val {
                next = head?.next
                head = nil
                head = next
                continue
            }

            next = head?.next
            head?.next = prev
            prev = head
            head = next
        }

        return prev
    }

    // MARK: -> This is the Leetcode Solution
    /// This solution will not compile here, but in leetcode it will
//    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
//        var prev: ListNode?
//        var next: ListNode?
//        var headNode = head
//
//        while headNode != nil {
//            if headNode!.val as! Int == val {
//                next = headNode?.next
//                headNode = nil
//                headNode = next
//                continue
//            }
//
//            next = headNode?.next
//            headNode?.next = prev
//            prev = headNode
//            headNode = next
//        }
//
        //This is needed to put the list back in order
//        while prev != nil {
//            next = prev?.next
//            prev?.next = headNode
//            headNode = prev
//            prev = next
//        }
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
var six = 6
linkedList.removeElements(six)


