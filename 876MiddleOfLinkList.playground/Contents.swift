import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?

    public init(_ val: Int, next: ListNode? = nil) {
       self.val = val
       self.next = nil
    }
}

extension ListNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }

        return "\(val) -> " + String(describing: next) + " "
    }
}

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }

        var fastPointer: ListNode? = head
        var slowPointer: ListNode? = head

        while fastPointer != nil {
            fastPointer = head?.next

            if fastPointer == nil {
                continue
            }

            if fastPointer != nil {
                slowPointer = head?.next
            }
        }

        return slowPointer
    }

    //[1,2,3,4,5]
    func middleNode2(_ head: ListNode?) ->ListNode? {
        var slowPointer = head
        var fastPointer = head

        while fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }

        return slowPointer
    }
}


var solution = Solution()

