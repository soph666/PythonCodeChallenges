class Solution:
    def isValid(self, s: str) -> bool:
        # stack where the last in first out

        d1 = {"(": ")", "{": "}", "[": "]"}
        d2 = {")": "(", "}": "{", "]": "["}

        if len(s) % 2 != 0:
            return False
        stack = []

        for b in s:
            if b in d1:
                stack.append(b)
            else:
                if len(stack) < 1 or not (d2[b] in stack):
                    return False
                else:
                    prev = stack[-1]
                    if d1[prev] == b:
                        stack.pop()
                    else:
                        return False
        if len(stack) == 0:
            return True
        else:
            return False