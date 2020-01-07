
/*
Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.

Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)

Example 1:

[[0,0,1,0,0,0,0,1,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,1,1,0,1,0,0,0,0,0,0,0,0],
 [0,1,0,0,1,1,0,0,1,0,1,0,0],
 [0,1,0,0,1,1,0,0,1,1,1,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,0,0,0,0,0,0,1,1,0,0,0,0]]
Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
Example 2:

[[0,0,0,0,0,0,0,0]]
Given the above grid, return 0.
Note: The length of each dimension in the given grid does not exceed 50.

*/

class Solution {

  private func getArea(_ grid: inout [[Int]], _ i: Int, _ j: Int) -> Int {

    let row = grid.count, col = grid[0].count
    guard i >= 0, i < row, j >= 0, j < col else {
      return 0
    } 

    if grid[i][j] == 0 {
      return 0
    }

    grid[i][j] = 0
    let left = getArea(&grid, i-1, j)
    let right = getArea(&grid, i+1, j)
    let up = getArea(&grid, i, j+1)
    let down = getArea(&grid, i, j-1)

    return left + right + up + down + 1
  } 
  
  func maxAreaOfIsland(_ grid: [[Int]]) -> Int {

    var maxArea = 0
    var grid = grid
    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if grid[i][j] == 1 {
          let area = getArea(&grid, i, j)
          maxArea = max(maxArea, area)
        } 
      }
    }

    return maxArea
  }
}

let solution = Solution()
let input = [
[0,0,1,0,0,0,0,1,0,0,0,0,0],
[0,0,0,0,0,0,0,1,1,1,0,0,0],
[0,1,1,0,1,0,0,0,0,0,0,0,0],
[0,1,0,0,1,1,0,0,1,0,1,0,0],
[0,1,0,0,1,1,0,0,1,1,1,0,0],
[0,0,0,0,0,0,0,0,0,0,1,0,0],
[0,0,0,0,0,0,0,1,1,1,0,0,0],
[0,0,0,0,0,0,0,1,1,0,0,0,0]]

let res = solution.maxAreaOfIsland(input)
print("res: ", res)

