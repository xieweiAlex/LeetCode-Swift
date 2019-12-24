/**
 * Question Link: https://leetcode.com/problems/symmetric-tree/
 * Primary idea: recursion
 * Time Complexity: O(n), Space Complexity: O(n)
 * 
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 *
 */
 
class SymmetricTree {
  private func isSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
    if left == nil, right == nil {
      return true 
    }  

    // Return false if one of node be nil 
    guard let left = left, let right = right, left.val == right.val else {
      return false
    } 

    return isSymmetric(left.left, right.right) && isSymmetric(left.right, right.left)
  }

  func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let root = root else {
      return true
    }

    return isSymmetric(root.left, root.right)
  }
}
