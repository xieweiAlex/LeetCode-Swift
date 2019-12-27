/**
 * Question Link: https://leetcode.com/problems/binary-tree-vertical-order-traversal/
 * Primary idea: Use queues to hold TreeNode and column level, and a dictionary to 
 *               map column with its correspond TreeNode vals
 *
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
 */
 
class BinaryTreeVerticalOrderTraversal {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
      guard let root = root else {
        return []
      }

      var res = [[Int]]()
      var queueNode = [(TreeNode, Int)]()
      var colVals = [Int: [Int]](), minCol = 0, maxCol = 0

      queueNode.append((root, 0))
      while !queueNode.isEmpty {
        let (node, col) = queueNode.removeFirst()
        colVals[col, default: []].append(node.val)

        if let left = node.left {
          queueNode.append((left, col-1))
          minCol = min(minCol, col - 1)
        }
        if let right = node.right {
          queueNode.append((right, col+1))
          maxCol = max(maxCol, col + 1)
        }
      }

      for col in minCol...maxCol {
        res.append(colVals[col]!)
      }

      return res
    }
}
