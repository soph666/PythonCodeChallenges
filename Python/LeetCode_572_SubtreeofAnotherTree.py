# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isSubtree(self, root: Optional[TreeNode], subRoot: Optional[TreeNode]) -> bool:

        def runsubtree(r: Optional[TreeNode], sub: Optional[TreeNode]) -> bool:
            if r is None and sub is None:
                return True
            if r is None and sub:
                return False
            if r and sub is None:
                return False
            if r.val != sub.val:
                return False
            return r.val == sub.val and runsubtree(r.left, sub.left) and runsubtree(r.right, sub.right)

        if subRoot is None:
            return True
        if root is None:
            return False
        if runsubtree(root, subRoot):
            return True

        return any([self.isSubtree(root.left, subRoot), self.isSubtree(root.right, subRoot)])

