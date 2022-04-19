# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Solution:
    def lowestCommonAncestor(self, root: TreeNode, p: TreeNode, q: TreeNode) -> TreeNode:
        # two cases where one is p and q are children or children or children of LCD
        # another is one of p or q is the LCD in that case it's the root
        # what if p and q don't exist, assume it always will exist
        # preorder run

        if root is None:
            return None
        if root.val > p.val and root.val > q.val:
            return self.lowestCommonAncestor(root.left, p, q)
        if root.val < p.val and root.val < q.val:
            return self.lowestCommonAncestor(root.right, p, q)
        if (root.val <= p.val and root.val >= q.val) or (root.val >= p.val and root.val <= q.val):
            return root
