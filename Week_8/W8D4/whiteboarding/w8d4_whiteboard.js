// Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
// Example 1:
// Input: "babad"
// Output: "bab"
// Note: "aba" is also a valid answer.
// Example 2:
// Input: "cbbd"
// Output: "bb"

longestPalindrome = function () {
    // for(i = 0; i < this.length - 1; i++) {
    //     for(j = i + 1; j < this.length; j++) {
    //         let substring = this.slice(i,j)
    //         let longest = ""
    //         if(substring.length > longest.length) {
    //             longest = substring
    //         }
    //     }
    // }
    // return longest
}

console.log("babad".longestPalindrome())

// Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
// Integers in each row are sorted from left to right.
// The first integer of each row is greater than the last integer of the previous row.
// Example 1:
// Input:
// matrix = [
//   [1,   3,  5,  7],
//   [10, 11, 16, 20],
//   [23, 30, 34, 50]
// ]
// target = 3
// Output: true
// Example 2:
// Input:
// matrix = [
//   [1,   3,  5,  7],
//   [10, 11, 16, 20],
//   [23, 30, 34, 50]
// ]
// target = 13
// Output: false