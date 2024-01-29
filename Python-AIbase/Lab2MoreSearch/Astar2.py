from collections import deque


class Graph:
    # example of adjacency list (or rather map)
    # adjacency_list = {
    # 'A': [('B', 1), ('C', 3), ('D', 7)],
    # 'B': [('D', 5)],
    # 'C': [('D', 12)]
    # }

    def __init__(self, adjacency_list, heuristic):
        self.adjacency_list = adjacency_list
        self.h = heuristic

    def get_neighbors(self, v):
        return self.adjacency_list[v]

    # heuristic function with equal values for all nodes

    def a_star_algorithm(self, start_node, stop_node):
        # open_list is a list of nodes which have been visited, but who's neighbors
        # haven't all been inspected, starts off with the start node
        # closed_list is a list of nodes which have been visited
        # and who's neighbors have been inspected
        count_open = 0
        visited = []
        open_list = set([start_node])
        closed_list = set([])

        # g contains current distances from start_node to all other nodes
        # the default value (if it's not found in the map) is +infinity
        g = {}

        g[start_node] = 0

        # parents contains an adjacency map of all nodes
        parents = {}
        parents[start_node] = start_node

        while len(open_list) > 0:
            n = None

            # find a node with the lowest value of f() - evaluation function
            for v in open_list:
                if n == None or g[v] + self.h[v] < g[n] + self.h[n]:
                    n = v

            # if 2 nodes with the same value, then take node with lower label
                if g[v] == g[n] and v < n:
                    n = v

            if n == None:
                print('Path does not exist!')
                return None

            visited.append(n)

            # if the current node is the stop_node
            # then we begin reconstructin the path from it to the start_node
            if n == stop_node:
                reconst_path = []

                while parents[n] != n:
                    reconst_path.append(n)
                    n = parents[n]

                reconst_path.append(start_node)

                reconst_path.reverse()

                print(f'Number of nodes opened: {count_open}')
                print(f'Visited: <{', '.join(visited)}>')
                print('Path found: {}'.format(reconst_path))
                return reconst_path

            # for all neighbors of the current node do
            for (m, weight) in self.get_neighbors(n):
                # if the current node isn't in both open_list and closed_list
                # add it to open_list and note n as it's parent
                if m not in open_list and m not in closed_list:
                    count_open = count_open + 1
                    open_list.add(m)
                    parents[m] = n
                    g[m] = g[n] + weight

                # otherwise, check if it's quicker to first visit n, then m
                # and if it is, update parent data and g data
                # and if the node was in the closed_list, move it to open_list
                else:
                    if g[m] > g[n] + weight:
                        g[m] = g[n] + weight
                        parents[m] = n

                        if m in closed_list:
                            closed_list.remove(m)
                            open_list.add(m)

            # remove n from the open_list, and add it to closed_list
            # because all of his neighbors were inspected
            open_list.remove(n)
            closed_list.add(n)

        print('Path does not exist!')
        return None

    def ucs_algorithm(self, start_node, stop_node):
        # ucs_algorithm chỉ quang tâm tới g
        print(f"ucs_algorithm start: {start_node} end: {stop_node}")

        # open_list is a list of nodes which have been visited, but who's neighbors
        # haven't all been inspected, starts off with the start node
        # closed_list is a list of nodes which have been visited
        # and who's neighbors have been inspected
        count_open = 0
        open_list = set([start_node])
        closed_list = set([])

        # g contains current distances from start_node to all other nodes
        # the default value (if it's not found in the map) is +infinity
        g = {}

        g[start_node] = 0

        # parents contains an adjacency map of all nodes
        parents = {}
        parents[start_node] = start_node

        while len(open_list) > 0:
            n = None

            # find a node with the lowest value of f() - evaluation function
            for v in open_list:
                if n == None or g[v] < g[n]:
                    n = v
                # if 2 nodes with the same value, then take node with lower label
                if g[v] == g[n] and v < n:
                    n = v

            if n == None:
                print('Path does not exist!')
                return None

            # if the current node is the stop_node
            # then we begin reconstructin the path from it to the start_node
            if n == stop_node:
                reconst_path = []

                while parents[n] != n:
                    reconst_path.append(n)
                    n = parents[n]

                reconst_path.append(start_node)

                reconst_path.reverse()

                print(f'Number of nodes opened: {count_open}')
                print('Path found: {}'.format(reconst_path))
                return reconst_path

            # for all neighbors of the current node do
            for (m, weight) in self.get_neighbors(n):
                # if the current node isn't in both open_list and closed_list
                # add it to open_list and note n as it's parent
                if m not in open_list and m not in closed_list:
                    count_open = count_open + 1
                    open_list.add(m)
                    parents[m] = n
                    g[m] = g[n] + weight

                # otherwise, check if it's quicker to first visit n, then m
                # and if it is, update parent data and g data
                # and if the node was in the closed_list, move it to open_list
                else:
                    if g[m] > g[n] + weight:
                        g[m] = g[n] + weight
                        parents[m] = n

                        if m in closed_list:
                            closed_list.remove(m)
                            open_list.add(m)

            # remove n from the open_list, and add it to closed_list
            # because all of his neighbors were inspected
            open_list.remove(n)
            closed_list.add(n)

        print('Path does not exist!')
        return None

    def greedy_algorithm(self, start_node, stop_node):
        print(f"greedy_algorithm start: {start_node} end: {stop_node}")
        # greedy_algorithm chỉ quang tâm tới h

        # open_list is a list of nodes which have been visited, but who's neighbors
        # haven't all been inspected, starts off with the start node
        # closed_list is a list of nodes which have been visited
        # and who's neighbors have been inspected
        count_open = 0
        open_list = set([start_node])
        closed_list = set([])

        # g contains current distances from start_node to all other nodes
        # the default value (if it's not found in the map) is +infinity
        g = {}

        g[start_node] = 0

        # parents contains an adjacency map of all nodes
        parents = {}
        parents[start_node] = start_node

        while len(open_list) > 0:
            n = None

            # find a node with the lowest value of f() - evaluation function
            for v in open_list:
                if n == None or self.h[v] < self.h[n]:
                    n = v

                # if 2 nodes with the same value, then take node with lower label
                if self.h[v] == self.h[n] and v < n:
                    n = v

            if n == None:
                print('Path does not exist!')
                return None

            # if the current node is the stop_node
            # then we begin reconstructin the path from it to the start_node
            if n == stop_node:
                reconst_path = []

                while parents[n] != n:
                    reconst_path.append(n)
                    n = parents[n]

                reconst_path.append(start_node)

                reconst_path.reverse()

                print(f'Number of nodes opened: {count_open}')
                print('Path found: {}'.format(reconst_path))
                return reconst_path

            # for all neighbors of the current node do
            for (m, weight) in self.get_neighbors(n):
                # if the current node isn't in both open_list and closed_list
                # add it to open_list and note n as it's parent
                if m not in open_list and m not in closed_list:
                    count_open = count_open + 1
                    open_list.add(m)
                    parents[m] = n
                    g[m] = g[n] + weight

                # otherwise, check if it's quicker to first visit n, then m
                # and if it is, update parent data and g data
                # and if the node was in the closed_list, move it to open_list
                # else:
                #     if m in closed_list:
                #         closed_list.remove(m)
                #         open_list.add(m)

                    # if g[m] > g[n] + weight:
                    #     g[m] = g[n] + weight
                    #     parents[m] = n

                    #     if m in closed_list:
                    #         closed_list.remove(m)
                    #         open_list.add(m)

            # remove n from the open_list, and add it to closed_list
            # because all of his neighbors were inspected
            open_list.remove(n)
            closed_list.add(n)
        return None


# adjacency_list = {
#     'A': [('B', 1), ('C', 3), ('D', 7)],
#     'B': [('D', 5)],
#     'C': [('D', 12)],
#     'D': []
# }
# heuristic1 = {
#     'A': 1,
#     'B': 1,
#     'C': 1,
#     'D': 1
# }
# graph1 = Graph(adjacency_list, heuristic1)
# graph1.a_star_algorithm('A', 'D')


adjacency_list_g1 = {
    'S': [('A', 2), ('B', 1), ('F', 3)],
    'A': [('C', 2), ('D', 3)],
    'B': [('D', 2), ('E', 4)],
    'C': [('G', 4)],
    'D': [('G', 4)],
    'E': [],
    'F': [('G', 6)],
    'G': [],
}
heuristic_g1 = {
    'S': 6,
    'A': 4,
    'B': 5,
    'C': 2,
    'D': 2,
    'E': 8,
    'F': 4,
    'G': 0,
}

# graph1 = Graph(adjacency_list_g1, heuristic_g1)
# graph1.a_star_algorithm('S', 'G')
# graph1.greedy_algorithm('S', 'G')
# graph1.ucs_algorithm('S', 'G')


adjacency_list_g2 = {
    'a': [('b', 1), ('c', 1)],
    'b': [('a', 1), ('d', 1)],
    'c': [('a', 1), ('k', 1)],
    'd': [('b', 1), ('e', 1), ('m', 1)],
    'e': [('d', 1), ('m', 1), ('n', 1)],
    'f': [('s', 1), ('p', 1)],
    'g': [('m', 1), ('t', 1)],
    'h': [('s', 1), ('k', 1)],
    'k': [('c', 1), ('h', 1)],
    'm': [('d', 1), ('n', 1), ('g', 1)],
    'n': [('e', 1), ('m', 1)],
    'p': [('f', 1), ('q', 1)],
    'q': [('p', 1), ('r', 1)],
    'r': [('q', 1), ('t', 1)],
    't': [('r', 1), ('g', 1)],
    's': [('h', 1), ('f', 1)]
}

heuristic_g2_h = {
    'a': 4,
    'b': 4,
    'c': 3,
    'd': 2,
    'e': 3,
    'f': 5,
    'g': 0,
    'k': 2,
    'h': 3,
    'm': 1,
    'n': 2,
    'p': 4,
    'q': 3,
    't': 1,
    'r': 2,
    's': 4,
}

# graph2 = Graph(adjacency_list_g2, heuristic_g2_h)
# graph2.a_star_algorithm('s', 'g')


adjacency_list_g3 = {
    'A': [('B', 1), ('C', 4)],
    'B': [('A', 1), ('C', 1), ('D', 5)],
    'C': [('A', 4), ('B', 1), ('D', 3)],
    'D': [('B', 5), ('C', 3), ('E', 8), ('F', 3), ('G', 9)],
    'E': [('D', 8), ('G', 2)],
    'F': [('D', 3), ('G', 5)],
    'G': [('D', 9), ('E', 2), ('F', 5)],
}
heuristic_g3_h1 = {
    'A': 9.5,
    'B': 9,
    'C': 8,
    'D': 7,
    'E': 1.5,
    'F': 4,
    'G': 0,
}
heuristic_g3_h2 = {
    'A': 10,
    'B': 12,
    'C': 10,
    'D': 8,
    'E': 1,
    'F': 4.5,
    'G': 0,
}

graph3_h1 = Graph(adjacency_list_g3, heuristic_g3_h1)
graph3_h2 = Graph(adjacency_list_g3, heuristic_g3_h2)
graph3_h1.a_star_algorithm('A', 'G')
graph3_h2.a_star_algorithm('A', 'G')

graph3_h1.ucs_algorithm('A', 'G')
graph3_h1.greedy_algorithm('A', 'G')
