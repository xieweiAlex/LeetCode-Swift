/*
Given a non-empty binary tree, find the maximum path sum.

For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

Example 1:

Input: [1,2,3]

       1
      / \
     2   3

Output: 6
Example 2:

Input: [-10,9,20,null,null,15,7]

   -10
   / \
  9  20
    /  \
   15   7

Output: 42

*/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {

  private func maxPathDown(_ root: TreeNode?, _ maxValue: inout Int) -> Int {
    guard let root = root else {
      return 0
    }

    let leftVal = max(0, maxPathDown(root.left, &maxValue))
    let rightVal = max(0, maxPathDown(root.right, &maxValue))
    maxValue = max(maxValue, root.val + leftVal + rightVal)

    return max(leftVal, rightVal) + root.val
  }

  func maxPathSum(_ root: TreeNode?) -> Int {

    var maxValue = Int.min
    _ = maxPathDown(root, &maxValue)

    return maxValue
  }
}


let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)

let solution = Solution()
let res = solution.maxPathSum(root)
print("res: ", res)


