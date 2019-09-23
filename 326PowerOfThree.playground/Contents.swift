import UIKit


func isPowerOfThree(n: Int) -> Bool {
    if n > 0 || n % 3 == 0 {
        return isPowerOfThree(n: n / 3)
    } else if n == 1 {
        return true
    } else {
        return false
    }
}
