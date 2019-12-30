/**
 * Question Link: https://leetcode.com/problems/swap-nodes-in-pairs/
 * Primary idea: Three Pointers, each time change pointers' directions 
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

class SwapNodesInPairs {

  func swapPairs(head: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var curr = dummy 

    while var first = curr.next, var second = first.next {
      curr.next = second
      first.next = second.next
      second.next = first
      curr = first
    }

    return dummy.next
  }
}
