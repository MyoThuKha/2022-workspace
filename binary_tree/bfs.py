#Breadth First Search (iterative)
class Node:
    def __init__(self,value):
        self.value = value
        self.left = None
        self.right = None

class bfs:
    def __init__(self,node):
        self.node = node

    def implement(self):
        if (self.node == None):
            return []
        queue = [self.node]
        val = []
        while (len(queue) != 0):
            curr = queue[0]
            val.append(curr.value)
            if (curr.left != None):
                queue.append(curr.left)
            if (curr.right != None):
                queue.append(curr.right)
            queue.remove(curr)
        return val


root = Node(4)

node2 = Node(9)
node3 = Node(3)
node4 = Node(4)
node5 = Node(6)
node6 = Node(1)

root.left = node2
root.right = node3

node2.left = node4
node2.right = node5

node3.right = node6

bfs = bfs(root)
print(bfs.implement())
