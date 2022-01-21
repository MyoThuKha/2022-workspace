#Bread First Search (count will be in order)
class Node:
    def __init__(self,value):
        self.value = value
        self.left = None
        self.right = None

class bfs:
    def __init__(self,node,target):
        self.node = node
        self.target = target

    def find(self):
        queue = [self.node]
        count = 1
        while (len(queue) >= 1):
            curr = queue[0]
            if (curr.value == self.target):
                return count
            if (curr.left != None):
                queue.append(curr.left)
            if (curr.right != None):
                queue.append(curr.right)

            queue.remove(curr)
            count += 1
        return -1

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

bfs = bfs(root,2)
if (bfs.find() == -1):
    print("Not found in tree")
else:
    print("Found in node ",bfs.find())
