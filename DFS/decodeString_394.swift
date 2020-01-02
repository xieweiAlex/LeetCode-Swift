/*
Given an encoded string, return its decoded string.

The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

Examples:

s = "3[a]2[bc]", return "aaabcbc".
s = "3[a2[c]]", return "accaccacc".
s = "2[abc]3[cd]ef", return "abcabccdcdcdef".

*/

class Solution {

  func decodeString(_ s: String) -> String {

    var stack = [(str: String, cnt: Int)]()
    stack += [("", 1)]
    var num = ""

    for ch in s {
      if ch.isNumber {

        num += String(ch)
      } else if ch == "[", let cnt = Int(num) {

        stack.append(("", cnt))
        num = ""
      } else if ch == "]", stack.count > 0 {
        let (str, cnt) = stack.removeLast()

        // if var newLastItem = stack.last {
        //   let multipliedStr = String(repeating: str, count: cnt)
        //   newLastItem.str += multipliedStr
        //   stack[stack.count-1] = newLastItem
        // } 
        stack[stack.count-1].str += String(repeating: str, count: cnt)

      } else if ch.isLetter, stack.count > 0 {

        stack[stack.count-1].str += String(ch)
      }
    }

    guard let decodedStr = stack.last?.str else {
      return ""
    }

    return decodedStr
  }
}

let solution = Solution()
let input = "3[a2[c]]"
let res = solution.decodeString(input)
print("res: ", res)


