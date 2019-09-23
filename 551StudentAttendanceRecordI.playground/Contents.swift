import UIKit

class Solution {
    func checkRecord(_ s: String) -> Bool {
        var absent = 0
        var late = 0

        return checkRecord(s, absent: &absent, late: &late)
    }

    func checkRecord(_ s: String, value: Int = 0, absent: inout Int, late: inout Int) -> Bool {
        if s.count == value {
            return true
        }

        if Array(s)[value] == "A" {
            absent += 1

            if absent > 1 {
                return false
            }
        }

        if Array(s)[value] == "L" {
            late += 1

            if late > 2 {
                return false
            }
        } else {
            late = 0
        }

        return checkRecord(s, value: value + 1, absent: &absent, late: &late)
    }
}
