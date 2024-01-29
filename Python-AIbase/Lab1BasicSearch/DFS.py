graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': ['F'],
    'F': []
}

graph1 = {
    's': ['d', 'e', 'p'],
    'a': [],
    'b': ['a'],
    'c': ['a'],
    'd': ['b', 'c', 'e'],
    'e': ['h', 'r'],
    'f': ['c', 'g'],
    'g': [],
    'h': ['p', 'q'],
    'p': ['q'],
    'q': [],
    'r': ['f']
}

graph2 = {
    'a': ['b', 'c'],
    'b': ['a', 'd'],
    'c': ['a', 'k'],
    'd': ['b', 'e', 'm'],
    'e': ['d', 'm', 'n'],
    'f': ['s', 'p'],
    'g': ['m', 't'],
    'h': ['s', 'k'],
    'k': ['c', 'h'],
    'm': ['d', 'n', 'g'],
    'n': ['e', 'm'],
    'p': ['f', 'q'],
    'q': ['p', 'r'],
    'r': ['q', 't'],
    't': ['r', 'g'],
    's': ['h', 'f']
}
graph3 = {
    'a': ['b', 'c'],
    'b': ['a', 'c', 'd'],
    'c': ['a', 'b', 'd'],
    'd': ['b', 'c', 'e', 'f', 'g'],
    'e': ['d', 'g'],
    'f': ['d', 'g'],
    'g': ['d', 'e', 'f']
}


def getIndexMaxNodeNeighbor(graph, stack):
    indexDeepNodeNeighbor = -1
    deepLength = -1
    for stackItemIndex, stackItem in enumerate(stack):
        lastNode = stackItem[-1]
        expandNeighborOfLastNode = graph.get(lastNode, [])
        # if  expandNeighborOfLastNode > deepLength then expandNeighborOfLastNode = deepLength
        # use operator >= to pick LIFO stack
        if len(expandNeighborOfLastNode) >= deepLength:
            deepLength = len(expandNeighborOfLastNode)
            indexDeepNodeNeighbor = stackItemIndex
    return indexDeepNodeNeighbor


def DFS(graph, start, end):
    visited = []  # List to keep track of visited nodes.
    stack = []  # Initialize a stack
    stack.append(start)
    while stack:
        # pop node having highest deep
        index = getIndexMaxNodeNeighbor(graph, stack)
        s = stack.pop(index)

        print(s, end=" ")
        if s == end:
            print("", end="\n")
            return
        visited.append(s)
        for neighbor in graph[s]:
            if neighbor not in visited:
                stack.append(neighbor)


# Driver Code

print("DFS print visited")
DFS(graph, 'A', 'E')
DFS(graph1, 's', 'g')
DFS(graph2, 's', 'g')
DFS(graph3, 'a', 'g')


# DFS with stack, and strategy deep node
def DFS_path(graph, start, end):
    visited = []
    stack = []
    stack.append([start])

    while stack:
        index = getIndexMaxNodeNeighbor(graph, stack)
        path = stack.pop(index)

        node = path[-1]
        if node == end:
            return path
        visited.append(node)
        for neighbor in graph.get(node, []):
            if neighbor not in visited:
                new_path = list(path)
                new_path.append(neighbor)
                stack.append(new_path)
    return "No path"


print("DFS print path")
print(DFS_path(graph1, 's', 'g'))
print(DFS_path(graph2, 's', 'g'))
print(DFS_path(graph3, 'a', 'g'))
