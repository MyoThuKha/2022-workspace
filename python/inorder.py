#        2
#       / \
#      4   6
#     / \ / \
#    3  7 9  3


#Depth First Traversals:
#(a) Inorder (Left, Root, Right) : 4 2 5 1 3
#(b) Preorder (Root, Left, Right) : 1 2 4 5 3
#(c) Postorder (Left, Right, Root) : 4 5 2 3 1
class node:
    def __init__(self,val=0,left= None,right= None):
        self.val = val
        self.right = right
        self.left = left

def inorder(node):
    if node is None:
        return
    print(node.val)
    inorder(node.left)
    inorder(node.right)
#this line is written by vim.
tree = node(12)
tree.left = node(9)
tree.right = node(3)

inorder(tree)
