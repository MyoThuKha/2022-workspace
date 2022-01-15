class Node:
    def __init__(self,val):
        self.val = val
        self.other = None

class linkedList:
    def __init__(self):
        self.head = None

    def printResult(self):
        lc_node = self.head
        while (lc_node != None):
            print(lc_node.val)
            lc_node = lc_node.other

start = linkedList()
node1 = Node(6)
node2 = Node(3)
node3 = Node(7)

start.head = node1
node1.other = node2
node2.other = node3

start.printResult()
