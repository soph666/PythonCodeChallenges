# Definition for singly-linked list.
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def hasCycle(self, head: Optional[ListNode]) -> bool:
        ht = {}
        cur = head
        while cur:
            if cur.val in ht:
                return True
            else:
                ht[cur.val] = 1
                cur = cur.next

        return False