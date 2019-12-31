/*
Sort a linked list in O(n log n) time using constant space complexity.

Example 1:

Input: 4->2->1->3
Output: 1->2->3->4
Example 2:

Input: -1->5->3->4->0
Output: -1->0->3->4->5
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
  func sortList(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
      return nil
    }

    if head.next == nil {
      return head
    }

    // Cut list into two halves 
    var fast: ListNode? = head, slow: ListNode? = head
    var prev: ListNode? = head

    // while let tmpFast = fast.next, tmpSlow = slow.next?.next {
    while fast != nil, fast?.next != nil {
      prev = slow

      slow = slow?.next 
      fast = fast?.next?.next
    }
    // cut the seoncd list off from prev node 
    prev?.next = nil

    // print("Print sorted list starting ^^^^^")
    // printList(head)
    // printList(slow)
    // print("Print sorted list end ^^^^^")

    // sort each part 
    let first = sortList(head)
    let second = sortList(slow)


    // merge two sorted list 
    return merge(first, second)
  }

  private func merge(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

    let dummy = ListNode(0)
    var cur = dummy
    var list1 = list1, list2 = list2
    while let tempList1 = list1, let tempList2 = list2 {
      if tempList1.val < tempList2.val {
        cur.next = tempList1
        list1 = tempList1.next
      } else {
        cur.next = tempList2
        list2 = tempList2.next
      }

      guard let next = cur.next else {
        print("No way no nex for cur node")
        return nil 
      }

      cur = next
    }

    // cur.next = list1 != nil ? list1: list2
    cur.next = list1 ?? list2

    return dummy.next
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

let node = ListNode(4)
let first = ListNode(2)
let second = ListNode(1)
let third = ListNode(3)
node.next = first
first.next = second 
second.next = third

print("original list: ")
printList(node)

let solution = Solution()
let newNode = solution.sortList(node)
printList(newNode)


