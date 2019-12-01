/*
All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T, for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.

Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.

Example:

Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
Output: ["AAAAACCCCC", "CCCCCAAAAA"]

The solutionns essentially use two sets to save "seen" and "repeated" substrings, every time get a substring if not "seen" add to "seen", if already "seen", add to "repeated".   

Time complexity is O(n), space complexity is O(n)
*/

class Solution {

  func findRepeatedDnaSequencesI(_ s: String) -> [String] {
    guard s.count > 10 else {
      return []
    }

    var seen = Set<String>()
    var repeated = Set<String>()
    print("s.count: ", s.count)
    for i in 0...s.count-10 {

      let startIndex = s.index(s.startIndex, offsetBy: i)
      let endIndex = s.index(s.startIndex, offsetBy: i+10)

      let seg = String(s[startIndex..<endIndex])

      print("Seen: ", seen)
      if seen.contains(seg) {
        repeated.insert(seg)
      } else {
        seen.insert(seg)
      }
    }

    return Array(repeated)
  }

  func findRepeatedDnaSequencesII(_ s: String) -> [String] {
    guard s.count > 10 else {
      return []
    }

    var seen = Set<String>()
    var repeated = Set<String>()
    let s = Array(s)
    for i in 0...s.count-10 {

      let str = String(s[i..<i+10])
      if seen.contains(str) {
        repeated.insert(str)
      } else {
        seen.insert(str)
      }
    }

    return Array(repeated)
  }

}

let solution = Solution()
let input = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
// let input = "AAAAAAAAAAA"
let res = solution.findRepeatedDnaSequencesII(input)
print("res ", res)

