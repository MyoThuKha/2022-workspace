class Node:
    def __init__(self,val):
        self.val = val
        self.left = None
        self.right = None

class depth_search:
    def __init__(self):
        self.stack = []
        self.val = []

    def implement(node):
        if (len(stack) == 0):
            return val
        val.append(node.val)
        stack.remove(node)
        if (stack.right != None):
            implement(stack.right)
        if (stack.left != None):
            implement(stack.left)

root = Node(4)
node2 = Node(9)
node3 = Node(3)
node4 = Node(2)
node5 = Node(6)
node6 = Node(1)

root.left = node2
root.right = node3

node2.left = node4
node2.right = node5

node3.right = node6

ds = depth_search()
ds.implement(root)
