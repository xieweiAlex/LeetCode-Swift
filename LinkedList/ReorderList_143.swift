/**
 * Question Link: https://leetcode.com/problems/reorder-list/
 * Primary idea: Use Runner Tech to split the list, reverse the second half, and merge them
 * Time Complexity: O(n), Space Complexity: O(1)
 *
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
  public var val: Int
  public var next: ListNode?
  public init(_ val: Int) {
    self.val = val
    self.next = nil
  }
}


class Solution {
  func reorderList(_ head: ListNode?) {
    guard let head = head, head.next != nil else {
      return 
    }

    var (first, second)  = splitList(head)

    second = reverse(second)

    merge(first, second)
  }

  private func splitList(_ head: ListNode) -> (prev: ListNode, post: ListNode) {

    var first = head, second = head 
    while let firstNext = first.next, let secondNext = second.next?.next {
      first = firstNext
      second = secondNext
    }

    second = first.next!
    first.next = nil

    print("first: ", first.val)
    print("second: ", second.val)
    return (head, second)
  }

  private func reverse(_ head: ListNode) -> ListNode {

    var head: ListNode? = head 
    var pre: ListNode!
    while let tmpHead = head {
      let node = tmpHead.next 
      tmpHead.next = pre
      pre = tmpHead 
      head = node
    }

    print("after reverse: pre: ", pre!.val)
    return pre
  }

  private func merge(_ first: ListNode?, _ second: ListNode?) {

    var first = first, second = second 
    while let tempFirst = first, let tempSecond = second {

      let firstNext = tempFirst.next 
      let secondNext = tempSecond.next 

      tempFirst.next = second 
      tempSecond.next = firstNext

      first = firstNext
      second = secondNext
    }

  }
}

func printList(_ listNode: ListNode?) {

  print("Print list begin: ----------")
  var listNode = listNode
  while let node = listNode {
    print("node: ", node.val)
    listNode = node.next
  }
}


let node = ListNode(1)
let first = ListNode(2)
let second = ListNode(3)
let third = ListNode(4)
node.next = first
first.next = second 
second.next = third

let solution = Solution()
solution.reorderList(node)

printList(node)



