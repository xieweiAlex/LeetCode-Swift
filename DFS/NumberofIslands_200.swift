/**
 * Question Link: https://leetcode.com/problems/number-of-islands/
 * Primary idea: Classic Depth-first Search, go up, down, left, right four directions
 * 
 * Time Complexity: O(mn), Space Complexity: O(1)
 *
 */

class Solution {
  func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 && grid[0].count > 0 else {
      return 0
    }

    var grid = grid
    var count = 0

    for i in 0..<grid.count {
      for j in 0..<grid[0].count {
        if String(grid[i][j]) == "1" {
          count += 1
          _dfs(&grid, i, j)
        }
      }
    }

    return count
  }

  private func _dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int) {

    let m = grid.count 
    let n = grid[0].count 
    guard i >= 0, i < m, j >= 0, j < n else {
      return
    }

    if grid[i][j] == "0" {
      return 
    }

    grid[i][j] = "0"

    _dfs(&grid, i + 1, j)
    _dfs(&grid, i - 1, j)
    _dfs(&grid, i, j + 1)
    _dfs(&grid, i, j - 1)
  }
  
}
