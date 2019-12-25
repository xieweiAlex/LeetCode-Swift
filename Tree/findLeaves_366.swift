/*

Given a binary tree, collect a tree's nodes as if you were doing this: Collect and remove all leaves, repeat until the tree is empty.

 

Example:

Input: [1,2,3,4,5]
  
          1
         / \
        2   3
       / \     
      4   5    

Output: [[4,5,3],[2],[1]]
 

Explanation:

1. Removing the leaves [4,5,3] would result in this tree:

          1
         / 
        2          
 

2. Now removing the leaf [2] would result in this tree:

          1          
 

3. Now removing the leaf [1] would result in the empty tree:

          []         

Primary idea: Use recursion, get to the leaves and mark as level one and use a dictionary to memory the nodes in the same level, then bottom up 
Time Complexity: O(n), Space Complexity: O(n)
 */

// public class TreeNode {
//     public var val: Int
//     public var left: TreeNode?
//     public var right: TreeNode?
//     public init(_ val: Int) {
//         self.val = val
//         self.left = nil
//         self.right = nil
//     }
// }


class Solution {

  private func order(_ root: TreeNode?, _ dict: inout [Int: [Int]]) -> Int {
    guard let root = root else {
      return 0
    }

    let left = order(root.left, &dict)
    let right = order(root.right, &dict)
    let level = max(left, right) + 1
    dict[level, default: []] += [root.val]

    return level
  }

  func findLeaves(_ root: TreeNode?) -> [[Int]] {
    var dict = [Int: [Int]]()
    _ = order(root, &dict)

    let cnt = dict.keys.count 
    var res = [[Int]]()
    for i in 1..<cnt+1 {
      if let leaves = dict[i] {
        res.append(leaves)
      }
    }

    return res 
  }
}
