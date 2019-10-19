import UIKit

//Given a collection of distinct integers, return all possible permutations.

/*

 Input: [1,2,3]
 Output:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]

 */

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return []
        }

        var result = [[Int]]()
        var candidate = [Int]()

        backtracking(&result, &candidate, nums)

        return result
    }

    func backtracking(_ result: inout [[Int]], _ candidate: inout [Int], _ nums: [Int]) {
        if candidate.count == nums.count {
            result.append(candidate)
            print("permutation results -->> \(result)")
            return
        }

        for num in nums {
//            print("Nums on the stack is this --> \(nums)")
            print("This is num currently -->\(num)")
            if candidate.contains(num) {
                print("This is already stored ->> \(num)")
                continue
            }

            candidate.append(num)
            print("Currently this is candidate --->> \(candidate)")
            backtracking(&result, &candidate, nums)
            print("Removing --->> \(candidate)")
            print("-----------------------------------------")
            candidate.removeLast()
        }
    }
}

let solution = Solution()
solution.permute([1,2,3])

