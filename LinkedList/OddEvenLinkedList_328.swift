/**
 * Question Link: https://leetcode.com/problems/odd-even-linked-list/
 * Primary idea: Prev-post two pointers; change the prev and move both at a time
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
  func oddEvenList(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
      return nil
    }

    var odd: ListNode? = head
    var even: ListNode? = head.next, evenHead = even
    while odd?.next != nil, odd?.next?.next != nil {
      odd?.next = odd?.next?.next 
      even?.next = even?.next?.next 
      odd = odd?.next 
      even = even?.next 
    }

    odd?.next = evenHead

    return head
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
let fourth = ListNode(5)
node.next = first
first.next = second 
second.next = third
third.next = fourth

let solution = Solution()
let newNode = solution.oddEvenList(node)
printList(newNode)



