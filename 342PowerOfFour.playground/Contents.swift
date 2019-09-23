import UIKit

var str = "Hello, playground"

class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        if num > 0 && num % 4 == 0 {
            let z = num / 4
            return isPowerOfFour(z)
        } else if num == 1 {
            return true
        } else {
            return false
        }
    }
}
