/*
Design a data structure that supports all following operations in average O(1) time.

insert(val): Inserts an item val to the set if not already present.
remove(val): Removes an item val from the set if present.
getRandom: Returns a random element from current set of elements. Each element must have the same probability of being returned.
Example:

// Init an empty set.
RandomizedSet randomSet = new RandomizedSet();

// Inserts 1 to the set. Returns true as 1 was inserted successfully.
randomSet.insert(1);

// Returns false as 2 does not exist in the set.
randomSet.remove(2);

// Inserts 2 to the set, returns true. Set now contains [1,2].
randomSet.insert(2);

// getRandom should return either 1 or 2 randomly.
randomSet.getRandom();

// Removes 1 from the set, returns true. Set now contains [2].
randomSet.remove(1);

// 2 was already in the set, so return false.
randomSet.insert(2);

// Since 2 is the only number in the set, getRandom always return 2.
randomSet.getRandom();
*/

/**
* Question Link: https://leetcode.com/problems/insert-delete-getrandom-o1/
* Primary idea: Use dictionary to make the insert and delete action O(1), use list to get random element in O(1) 
*
* Time Complexity: O(1), Space Complexity: O(n)
*
*/

class RandomizedSet {


  var list = [Int]()
  var dict = [Int: Int]()

  /** Initialize your data structure here. */
  init() {
  }

  /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
  func insert(_ val: Int) -> Bool {
    if dict[val] != nil {
      return false
    }

    dict[val] = list.count  
    list.append(val)
    return true
  }

  /** Removes a value from the set. Returns true if the set contained the specified element. */
  func remove(_ val: Int) -> Bool {
    if let idx = dict[val], let last = list.last {
      list[idx] = last
      dict[last] = idx
      dict[val] = nil
      list.removeLast()
      return true
    }

    return false
  }

  /** Get a random element from the set. */
  func getRandom() -> Int {
    if let randomNum = list.randomElement() {
      return randomNum
    }
    return -1
  }
  
}



