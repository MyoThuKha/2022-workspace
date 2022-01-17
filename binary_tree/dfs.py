# Depth first search (iterative)
class Node:
    def __init__(self,val):
        self.val = val
        self.left = None
        self.right = None

class Depth_search:
    def __init__(self,node):
        self.node = node

    def implement(self):
        val = []
        stack = [self.node]

        while (len(stack) != 0):
            current = stack[-1]
            val.append(current.val)

            # Adding right first, so the left out first.(stack)
            if (current.right != None):
                stack.append(current.right)
            if (current.left != None):
                stack.append(current.left)

            stack.remove(current)
        return val

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

ds = Depth_search(root)
print(ds.implement())
