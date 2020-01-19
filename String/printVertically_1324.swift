/*
Given a string s. Return all the words vertically in the same order in which they appear in s.
Words are returned as a list of strings, complete with spaces when is necessary. (Trailing spaces are not allowed).
Each word would be put on only one column and that in one column there will be only one word.

Example 1:
Input: s = "HOW ARE YOU"
Output: ["HAY","ORO","WEU"]
Explanation: Each word is printed vertically. 
 "HAY"
 "ORO"
 "WEU"

Example 2:
Input: s = "TO BE OR NOT TO BE"
Output: ["TBONTB","OEROOE","   T"]
Explanation: Trailing spaces is not allowed. 
"TBONTB"
"OEROOE"
"   T"

Example 3:
Input: s = "CONTEST IS COMING"
Output: ["CIC","OSO","N M","T I","E N","S G","T"]

Constraints:

1 <= s.length <= 200
s contains only upper case English letters.
It's guaranteed that there is only one space between 2 words.
*/

class Solution {

  private func getMaxLen(_ words: [String.SubSequence]) -> Int {
    var maxLen = 0
    for word in words {
      maxLen = max(maxLen, word.count)
    }
    return maxLen
  }

  func printVertically(_ s: String) -> [String] {
    
    let words = s.split(separator: " ")
    let maxLen = getMaxLen(words)
    var res = Array(repeating: "", count: maxLen)
    for (i, word) in words.enumerated() {
      let wordList = Array(word)
      for j in 0..<wordList.count {

        var vWrod = res[j]
        // add precursor " " when needed
        for _ in vWrod.count..<i {
          vWrod += " "
        }

        vWrod += String(wordList[j])
        res[j] = vWrod
      }      
    }

    return res
  }
}

let solution = Solution()
let input = "TO BE OR NOT TO BE"
let input1 = "CONTEST IS COMING"
let res = solution.printVertically(input)
let res1 = solution.printVertically(input1)
print("res: ", res)
print("res1: ", res1)

