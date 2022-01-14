class Node:
    def __init__(self,val):
        self.val = val
        self.other = None

class linkedList:
    def __init__(self):
        self.head = None

    def printResult(self):
        raise Exception("Unfinished work!!! Implement this function.")

start = linkedList()
node1 = Node(1)
node2 = Node(2)
node3 = Node(3)

start.head = node1
node1.other = node2
node2.other = node3

start.printResult()
