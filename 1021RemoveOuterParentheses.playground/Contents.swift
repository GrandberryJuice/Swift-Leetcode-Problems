import UIKit

/*
 This problem lends is self to using a stack.
 */

class Stack<T> {
    var array:[T] = []

    func push(value: T) -> T? {
       return array.append(value) as? T
    }

    func pop(value: T) -> T? {
        return array.removeLast()
    }

    func peak(value: T) -> T? {
        return array.last
    }

    // #1021 -> "(()())(())"

    func removeOuterParentheses(_ S: String) -> String {
        var counter = 0
        var stack:[String] = []

        for char in S {
            if char == "(" {
                if counter != 0 {
                    stack.append(String(char))
                }

                counter += 1
            } else {
                counter -= 1
                if counter != 0 {
                    stack.append(String(char))
                }
            }
        }

        return stack.joined(separator: " ")
    }
}

extension Stack: CustomStringConvertible {
    // 2
    var description: String {
        // 3
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"

        // 4
        let stackElements = array.reversed()
        // 5
        return topDivider + "\(stackElements)" + bottomDivider
    }
}

let stack = Stack<Int>()
stack.push(value: 10)
stack.push(value: 9)
stack.push(value: 8)
stack.array

stack.removeOuterParentheses("(()())(())")
