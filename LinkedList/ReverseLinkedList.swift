/**
 * Question Link: https://leetcode.com/problems/reverse-linked-list/
 * Primary idea: Use two helper nodes, traverse the linkedlist and change point direction each time
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

class ReverseLinkedList {
  func reverseList(_ head: ListNode?) -> ListNode? {
    var pre: ListNode?
    var head = head 
    while let tempHead = head {
      let node = tempHead.next 
      tempHead.next = pre 
      pre = tempHead
      head = node 
    }

    return pre
  }

  func reverseListI(_ head: ListNode?) -> ListNode? {
    guard let h = head, let next = h.next else {
      return head
    }

    let node = reverseListI(next)

    next.next = h
    h.next = nil

    return node
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

print("origin:  ---- ")
printList(node)

let solution = ReverseLinkedList()
let reversedNode = solution.reverseList(node)

printList(reversedNode)


