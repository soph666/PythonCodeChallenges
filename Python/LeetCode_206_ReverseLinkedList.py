# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        cur_node = head
        prev_node = None
        while cur_node:
            prev_node = ListNode(cur_node.val, prev_node)
            cur_node = cur_node.next
        return prev_node