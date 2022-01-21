class Node:
    def __init__(self,val):
        self.val = val
        self.left = None
        self.right = None

class bfs:
    def __init__(self,node):
        self.node = node
        self.queue = [self.node]
        self.value = []
    def preorder(self):
        if self.node == None:
            return []
        curr = self.queue[0]
        while (len(self.queue) > 0):
            self.value.append(curr.val)
            if (curr.left != None):
                self.queue.append(curr.left)
            if (curr.right != None):
                self.queue.append(curr.right)
            self.queue.remove(self.queue[0])
        return val
        
    
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

bfs = bfs(root)
bfs.preorder()
