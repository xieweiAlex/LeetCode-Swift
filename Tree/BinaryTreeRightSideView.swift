/**
 * Question Link: https://leetcode.com/problems/binary-tree-right-side-view/
 * Primary idea: use a queue to keep TreeNode, and for each level add the last one
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
 
class BinaryTreeRightSideView {

  // BFS 
  func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
      return []
    }

    var res = [Int]()
    var nodeQ = [root]

    while nodeQ.count > 0 {
      var size = nodeQ.count

      for i in 0..<size {
        let node = nodeQ.removeFirst()

        if i == size - 1 {
          res.append(node.val)
        }

        if let left = node.left {
          nodeQ.append(left)
        }
        if let right = node.right {
          nodeQ.append(right)
        }
      }
    }

    return res
  }

  // DFS
  func rightSideViewI(_ root: TreeNode?) -> [Int] {
    func getRightNode(_ root: TreeNode?, _ level: Int, _ dict: inout [Int: [Int]]) {
      guard let root = root else {
        return 
      }
      
      // var list = dict[level, default: []]
      // list.append(root.val)
      // dict[level] = list
      dict[level, default: []].append(root.val)
      
      getRightNode(root.left, level+1, &dict)
      getRightNode(root.right, level+1, &dict)
    }
    
    var dict = [Int: [Int]]() 
    getRightNode(root, 0, &dict)

    var res = [Int]()
    for i in 0..<dict.keys.count {
      if var list = dict[i], let val = list.popLast() {
        res.append(val)
      }
    }
   
    return res
  }

}
