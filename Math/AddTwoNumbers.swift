/**
 * Question Link: https://leetcode.com/problems/add-two-numbers/
 * Primary idea: use carry and iterate through both linked lists
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

class AddTwoNumbers {
  func addTwoNumbers(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    guard let l1 = l1 else {
      return l2
    }
    guard let l2 = l2 else {
      return l1
    }

    let outputNode = ListNode((l1.val + l2.val)%10)
    if l1.val + l2.val > 9 {
      outputNode.next = addTwoNumbers(addTwoNumbers(l1.next, l2.next),
                                      ListNode(1))
    } else {
      outputNode.next = addTwoNumbers(l1.next, l2.next)
    }


    return outputNode
  }


  func addTwoNumbersI(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

    let dummy = ListNode(0)
    var curr: ListNode? = dummy 
    var l1 = l1, l2 = l2
    var carry = 0
    while l1 != nil || l2 != nil {

      let x = l1?.val ?? 0
      let y = l2?.val ?? 0
      let sum = x + y + carry 
      carry = sum / 10 

      curr?.next = ListNode(sum % 10)
      curr = curr?.next
      if l1 != nil {
        l1 = l1?.next 
      }
      if l2 != nil {
        l2 = l2?.next 
      }
    }

    if carry > 0 { 
      curr?.next = ListNode(1)
    }

    return dummy.next
  }

}
