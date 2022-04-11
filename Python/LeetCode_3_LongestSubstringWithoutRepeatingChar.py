class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:

        # two ways that I can think of

        # list out all combination of it and filter for non repetitive then pick longest one

        # first of string is a then check second b, no repeat, then third c no repeat then hit
        # fourth a that's a repeat save the prev string then delete the head of the saved string
        # then repeat until finished the saved string should be the longest
        # replace

        longest = []
        max_count = 0
        s = list(s)

        for ss in s:
            if ss in longest:
                longest = longest[longest.index(ss) + 1:]
            longest.append(ss)

            ll = len(longest)
            if max_count < ll:
                max_count = ll

        return max_count