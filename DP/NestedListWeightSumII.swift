/**
 * Question Link: https://leetcode.com/problems/nested-list-weight-sum-ii/
 * Primary idea: Track depth for every number and max depth overall
 * Time Complexity: O(n), Space Complexity: O(n)
 *
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

 class NestedListWeightSumII {
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        var numDepth = [(Int, Int)](), maxDepth = 0
        
        helper(nestedList, 1, &maxDepth, &numDepth)
        
        return numDepth.reduce(0) { (total, numDepth) in total + numDepth.0 * (maxDepth - numDepth.1 + 1) }
    }
    
    private func helper(_ nestedList: [NestedInteger], _ depth: Int, _ maxDepth: inout Int, _ numDepth: inout [(Int, Int)]) {
        maxDepth = max(depth, maxDepth)
        
        for nestedInt in nestedList {
            if nestedInt.isInteger() {
                numDepth.append((nestedInt.getInteger(), depth))
            } else {
                helper(nestedInt.getList(), depth + 1, &maxDepth, &numDepth)
            }
        }
    }

    // DFS I
    private func dfs(_ nestedList: [NestedInteger], _ stack: inout [(value :Int, valDepth: Int)], _ depth: Int, _ maxDepth: inout Int) {

      for nestedInt in nestedList {
        if nestedInt.isInteger() {
          let newValue = nestedInt.getInteger()
          stack += [(newValue, depth)]
        } else {

          maxDepth = max(maxDepth, depth + 1)
          dfs(nestedInt.getList(), &stack, depth+1, &maxDepth)
        }
      }

    }

    func depthSumInverseI(_ nestedList: [NestedInteger]) -> Int {
      var stack = [(value: Int, valDepth: Int)]()

      var maxDepth = 1
      dfs(nestedList, &stack, 1, &maxDepth)

      print("maxDepth: ", maxDepth)
      var res = 0
      for (value, valDepth) in stack {
        print("level value: ", value, " depth: ", valDepth)
        res += value * (maxDepth - valDepth + 1)
      }

      return res 
    }

    // DFS II 

    private func dfsI(_ nestedList: [NestedInteger], _ dict: inout [Int: Int], _ depth: Int, _ maxDepth: inout Int) {

      for nestedInt in nestedList {
        if nestedInt.isInteger() {
          
          dict[depth, default: 0] += nestedInt.getInteger()
        } else {

          maxDepth = max(maxDepth, depth + 1)
          dfsI(nestedInt.getList(), &dict, depth + 1, &maxDepth)
        }
      }
    }

    func depthSumInverseII(_ nestedList: [NestedInteger]) -> Int {

      var dict = [Int: Int]()
      var maxDepth = 1
      dfsI(nestedList, &dict, 1, &maxDepth)

      var res = 0
      for key in dict.keys {
        if let value = dict[key] {
          
          res += value * (maxDepth - key + 1)
        }
      }
      return res
    }    

}

