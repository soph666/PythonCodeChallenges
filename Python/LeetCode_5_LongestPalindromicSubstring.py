class Solution:
    def longestPalindrome(self, s: str) -> str:

# 3 possible ways
# 1
# brute force finding all combinations then checking for palindrome

# 2
# loop through each letter then with each letter run expand on it to check if it's symmetric
# in this case you will have either 'aba' or 'abba'