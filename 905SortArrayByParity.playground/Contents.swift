import UIKit

/*
 Given an array A of non-negative integers, return an array consisting of all the even elements of A, followed by all the odd elements of A.

 You may return any answer array that satisfies this condition.

 Input: [3,1,2,4]
 Output: [2,4,3,1]
 The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
 */


class Solution {

    /*
     Time complexity = (n)
     Space complexity = (1)
     */

    func sortArrayByParity(_ A: inout [Int]) -> [Int] {
        var count = 0
        let loopCounter = A.count - 1

        for i in 0...loopCounter {
            if (A[i] % 2 == 0) {
                let temp = A[count]
                A[count] = A[i]
                A[i] = temp
                count += 1
            }
        }

        return A
    }

    // Time complexity = (n)
    // space comlexity = (n)
    func sortArray(_ A: [Int]) ->[Int] {
        var sortedArray:[Int] = []

        for i in A {
            if i % 2 == 0 {
                sortedArray.append(i)
            }
        }

        for i in A {
            if i % 2 != 0 {
                sortedArray.append(i)
            }
        }

        return sortedArray
    }
}


let solution = Solution()
var array = [3,1,2,4]
solution.sortArrayByParity(&array)
//solution.sortArray(array)
