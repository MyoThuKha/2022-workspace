class Node:
    def __init__(self,val):
        self.val = val
        self.left = None
        self.right = None

def printResult(node):
    if (node == None):
        return
    printResult(node.left)
    print(node.val)
    printResult(node.right)

root = Node(4)
node2 = Node(9)
node3 = Node(3)
node4 = Node(2)
node5 = Node(6)
node6 = Node(1)

root.left =node2
root.right = node3

node2.left =node4
node2.right = node5

node3.right = node6

printResult(root)
