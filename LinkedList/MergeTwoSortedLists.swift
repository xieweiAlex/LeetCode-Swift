/**
 * Question Link: https://leetcode.com/problems/merge-two-sorted-lists/
 * Primary idea: Dummy Node to traverse two lists, compare two nodes and point to the right one
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

class MergeTwoSortedLists {

    func mergeTwoLists(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
      let dummy = ListNode(0)
      var curr = dummy

      var l1 = l1, l2 = l2
      while let tmpL1 = l1, let tmpL2 = l2 {
        if tmpL1.val < tmpL2.val {
          curr.next = tmpL1
          l1 = tmpL1.next
        } else {
          curr.next = tmpL2
          l2 = tmpL2.next
        }

        guard let next = curr.next else {
          return nil 
        }
        curr = next
      }

      curr.next = l1 ?? l2
      return dummy.next
    }

    func mergeTwoListsI(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
      if l1 == nil, l2 == nil {
        return nil
      }

      if let l1 = l1, l2 == nil {

        return l1 
      } else if l1 == nil, let l2 = l2 {

        return l2 
      } else if var l1 = l1, var l2 = l2 {

        if l1.val > l2.val {
          (l1, l2) = (l2, l1)
        }

        l1.next = mergeTwoLists(l1.next, l2)
        return l1
      }       

      return nil     
    }
}
