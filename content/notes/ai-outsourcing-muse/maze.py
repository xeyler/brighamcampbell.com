import turtle
from itertools import product
from random import random

width = 25
height = 25

v_domain = range(width)
v_range = range(height)

# Use prim's algorithm to visit every node in the grid:
#   * this approach creates two separate trees
#   * each tree contains a non-zero number of edges
#   * together, the two trees cover every node
#   * the edge at which the trees meet is the path through the maze

unvisited_nodes = list(product(v_domain, v_range))
edges = dict()
cheapest_cost = dict()
cheapest_edge = dict()

for y in range(height):
    for x in range(width - 1):
        weight = -1 if y == 0 or y == height - 1 else random()
        edges[((x, y), (x + 1, y))] = weight
        edges[((x + 1, y), (x, y))] = weight

for y in range(height - 1):
    for x in range(width):
        # "continue" to avoid creating edges at the start and end of the maze
        if (x, y) == (0, 0):
            continue
        if (x, y) == (width - 1, height - 2):
            continue
        weight = -1 if x == 0 or x == width - 1 else random()
        edges[((x, y), (x, y + 1))] = weight
        edges[((x, y + 1), (x, y))] = weight

for node in unvisited_nodes:
    if ((0, 0), node) in edges:
        cheapest_cost[node] = edges[((0, 0), node)]
        cheapest_edge[node] = ((0, 0), node)
    elif ((width - 1, height - 1), node) in edges:
        cheapest_cost[node] = edges[((width - 1, height - 1), node)]
        cheapest_edge[node] = ((width - 1, height - 1), node)
    else:
        cheapest_cost[node] = 1

unvisited_nodes.remove((0, 0))
unvisited_nodes.remove((width - 1, height - 1))

turtle.setup(width = 500, height = 500)
turtle.setworldcoordinates(-1, -1, width, height)
turtle.hideturtle()
turtle.delay(5000 / (width * height))

# Visit one new node each iteration
while unvisited_nodes:
    lowest_cost = 1
    selected_edge = None
    for node in unvisited_nodes:
        if cheapest_cost[node] < lowest_cost:
            lowest_cost = cheapest_cost[node]
            selected_edge = cheapest_edge[node]
    unvisited_nodes.remove(selected_edge[1])
    connected_edges = {k:v for (k,v) in edges.items() if selected_edge[1] in k}
    for edge in connected_edges:
        if edges[edge] < cheapest_cost[edge[1]]:
            cheapest_cost[edge[1]] = edges[edge]
            cheapest_edge[edge[1]] = edge
    turtle.teleport(*selected_edge[0])
    turtle.goto(*selected_edge[1])
    
turtle.mainloop()
