/*
There are N students in a class. Some of them are friends, while some are not. Their friendship is transitive in nature. For example, if A is a direct friend of B, and B is a direct friend of C, then A is an indirect friend of C. And we defined a friend circle is a group of students who are direct or indirect friends.

Given a N*N matrix M representing the friend relationship between students in the class. If M[i][j] = 1, then the ith and jth students are direct friends with each other, otherwise not. And you have to output the total number of friend circles among all the students.

Example 1:
Input: 
[[1,1,0],
 [1,1,0],
 [0,0,1]]
Output: 2
Explanation:The 0th and 1st students are direct friends, so they are in a friend circle. 
The 2nd student himself is in a friend circle. So return 2.
Example 2:
Input: 
[[1,1,0],
 [1,1,1],
 [0,1,1]]
Output: 1
Explanation:The 0th and 1st students are direct friends, the 1st and 2nd students are direct friends, 
so the 0th and 2nd students are indirect friends. All of them are in the same friend circle, so return 1.
Note:
N is in range [1,200].
M[i][i] = 1 for all students.
If M[i][j] = 1, then M[j][i] = 1.

Primary idea: Use an Array(visited) to represent person to be visited, exhaust through the matrix row by row and column by column,  once we find M[i][j] == 1 && visited[j] == false, then go to the j row and check columns one by one. 
Time complexity:O(mn)  Space Complexity: O(n)

*/

class Solution {

  private func dfs(_ matrix: [[Int]], _ visited: inout [Bool], _ i: Int) {
    
    for j in 0..<matrix.count {
      if matrix[i][j] == 1, !visited[j] {
        visited[j] = true
        dfs(matrix, &visited, j) 
      }
    }
  }

  func findCircleNum(_ M: [[Int]]) -> Int {

    var visited = Array(repeating: false, count: M.count)
    var count = 0
    for i in 0..<M.count {
      if !visited[i] {
        visited[i] = true
        count += 1
        dfs(M, &visited, i)
      }
    }

    return count
  }
}

let solution = Solution()
// let input = [[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]]
let input = [[1,1,0],[1,1,0],[0,0,1]]
let res = solution.findCircleNum(input)
print("res: ", res)


