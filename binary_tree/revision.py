class Node:
    def __init__(self,val):
        self.val = val
        self.left = None
        self.right = None

#dfs(iterative)
class dfs:
    def __init__(self,node):
        self.stack = [node]
        self.track = []

    def result(self):
        while (len(self.stack) != 0):
            curr = self.stack[-1]
            self.track.append(curr.val)
            if (curr.left != None):
                self.stack.append(curr.left)
            if (curr.right != None):
                self.stack.append(curr.right)
            self.stack.remove(curr)
        return self.track

root = Node(1)
node2 = Node(2)
node3 = Node(3)
node4 = Node(4)
node5 = Node(5)
node6 = Node(6)

root.left = node2
root.right = node3

node2.left = node4
node2.right = node5

node3.right = node6

dfs = dfs(root)
print(dfs.result())
