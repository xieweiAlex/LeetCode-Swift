/*
Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.

Calling next() will return the next smallest number in the BST.

Example:

   7
3     15
    9   20  


BSTIterator iterator = new BSTIterator(root);
iterator.next();    // return 3
iterator.next();    // return 7
iterator.hasNext(); // return true
iterator.next();    // return 9
iterator.hasNext(); // return true
iterator.next();    // return 15
iterator.hasNext(); // return true
iterator.next();    // return 20
iterator.hasNext(); // return false


Primary idea: Use Stack and inorder traversal to pack the stack which let smallest node on the top of Stack, when call 
              next() it would re-pack the stack by right of the current smallest node's possible all left nodes   
Time Complexity: Init() O(n), next() O(n), hasNext O(1), Sapce complexity: O(n)

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

class BSTIterator {

    var stack = [TreeNode]() 
  
    init(_ root: TreeNode?) {
      guard let root = root else {
        return 
      } 

      pushNodesOnLeft(root)
    }
  
    private func pushNodesOnLeft(_ node: TreeNode?) {

      var node = node 
      while let tmpNode = node {
        stack.append(tmpNode)
        node = node!.left
      }
    }
    
    /** @return the next smallest number */
    func next() -> Int {
      guard !stack.isEmpty, let node = stack.popLast() else {
        return -1
      }
        
      pushNodesOnLeft(node.right)
      
      return node.val
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        
      return !stack.isEmpty
    }
}

let root = TreeNode(7)
root.left = TreeNode(3)

let right = TreeNode(15)
right.left = TreeNode(9)
right.right = TreeNode(20)
root.right = right

let iterator = BSTIterator(root)
print(iterator.next())   
print(iterator.next())  
print(iterator.hasNext())
print(iterator.next())
print(iterator.hasNext())
print(iterator.next())
print(iterator.hasNext())
print(iterator.next())
print(iterator.hasNext())

