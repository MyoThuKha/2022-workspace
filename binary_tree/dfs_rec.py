#Depth First Search (recursive)
class Node:
    def __init__(self,val):
        self.val = val
        self.left = None
        self.right = None

def implement(node,value):
    if (node == None):
        return []
    #root.val, root.left, root.right
    value.append(node.val)
    implement(node.left,value)
    implement(node.right,value)
    return value

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
print(implement(root,[]))
