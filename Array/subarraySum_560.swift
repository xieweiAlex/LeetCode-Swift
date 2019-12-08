/*
Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

Example 1:
Input:nums = [1,1,1], k = 2
Output: 2
Note:
The length of the array is in range [1, 20,000].
The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
*/

/*

 * Question Link: https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/
 * Primary idea 1: brutal force double loop through the Array, find all the possible subarray whose sum equals to k     
 * Primary idea 2: use a dictionary to save all the accumulated sum from beginning, if there is `dict[sum - k]` exist, it mean there are 1+ segments sums to k, get the cnt and plus by 1. This solution is kind of brain twist. 
 *
 * Time Complexity for 2: O(n), Space Complexity: O(n)
*/

class Solution {
  func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var cnt = 0
    for start in 0..<nums.count {
      var sum = 0
      for end in start..<nums.count {
        sum += nums[end]
        if sum == k {
          cnt += 1
        }
      }
    }
    return cnt
  }


  func subarraySumI(_ nums: [Int], _ k: Int) -> Int {
    var dict = [0: 1]
    var cnt = 0, sum = 0
    for num in nums {
      sum += num 
      if let value = dict[sum-k] {
        cnt += value
      }

      dict[sum, default: 0] += 1
    }

    return cnt
  }
}

let a = [1, 2, 1, -1, 1, 2] 

let solution = Solution()
let res = solution.subarraySum(a, 3)
print("res is: ", res)
let res1 = solution.subarraySumI(a, 3)
print("res1 is: ", res1)

