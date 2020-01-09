/*
Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.

For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

Example:

Given the sorted linked list: [-10,-3,0,5,9],

One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

      0
     / \
   -3   9
   /   /
 -10  5

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

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}


class Solution {

  private func sortedListToBST(_ head: ListNode?, _ tail: ListNode?) -> TreeNode? {
    if head === tail {
      return nil
    }

    var fast = head, slow = head 
    while fast != nil, fast?.next != nil {
      fast = fast?.next?.next 
      slow = slow?.next
    }

    guard let abSlow = slow else {
      // should not happen here
      return nil
    }

    let newHead = TreeNode(abSlow.val)
    newHead.left = sortedListToBST(head, slow)
    newHead.right = sortedListToBST(slow?.next, tail)

    return newHead
  }

  func sortedListToBST(_ head: ListNode?) -> TreeNode? {

    return sortedListToBST(head, nil)
  }
}


