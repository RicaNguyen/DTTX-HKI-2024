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


def BFS(graph, start, end):
    visited = []  # List to keep track of visited nodes.
    queue = []  # Initialize a queue
    queue.append(start)
    while queue:
        s = queue.pop(0)

        print(s, end=" ")
        if s == end:
            print("", end="\n")
            return
        visited.append(s)
        for neighbor in graph[s]:
            if neighbor not in visited:
                queue.append(neighbor)


# Driver Code

print("BFS print visited")
BFS(graph, 'A', 'E')
BFS(graph1, 's', 'g')
BFS(graph2, 's', 'g')
BFS(graph3, 'a', 'g')
#########################################


def BFS_path(graph, start, end):
    # maintain a queue of paths
    visited = []
    queue = []

    # push the first path into the queue
    queue.append([start])
    while queue:
        # get the first path from the queue
        path = queue.pop(0)
        # get the last node from the path
        node = path[-1]
        # path found
        if node == end:
            return path
        visited.append(node)
        # enumerate all adjacent nodes, construct a new path and push it into the queue
        for neighbour in graph.get(node, []):
            if neighbour not in visited:
                new_path = list(path)
                new_path.append(neighbour)
                queue.append(new_path)
    return "No path"


print("BFS print path")
print(BFS_path(graph1, 's', 'g'))
print(BFS_path(graph2, 's', 'g'))
print(BFS_path(graph3, 'a', 'g'))
