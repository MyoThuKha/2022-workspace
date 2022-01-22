class Node:
    def __init__(self,val):
        self.val = val
        self.left = None
        self.right = None

class dfs:
    def __init__(self,node):
        self.node = node
        self.stack = [self.node]

    def sum(self):
        if self.node == None:
            return 0
        sum = 0
        while (len(self.stack) >0):
            curr = self.stack[-1]
            sum += curr.val
            if (curr.left != None):
                self.stack.append(curr.left)
            if (curr.right != None):
                self.stack.append(curr.right)
            self.stack.remove(curr)
        return sum

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

dfs = dfs(root)
print(dfs.sum())
