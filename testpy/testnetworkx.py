#!/usr/bin/env python
'''
Demos for networkx package
'''
import networkx as nx
import matplotlib.pyplot as plt
from networkx.algorithms import approximation as approx

print '\nCreate graph...'
G = nx.Graph()

G.add_node(11)
G.add_nodes_from([12, 13])
G.add_node("spam")
G.add_nodes_from("spam")
H = nx.path_graph(10)
G.add_nodes_from(H)  # G now contains the nodes of H as nodes of G
G.remove_node(13)

G.add_edge(1, 2)
E = (2, 3)
G.add_edge(*E)
G.add_edges_from([(1, 2), (1, 3)])
G.add_edges_from(H.edges())

G.add_edge(1, 8)
G[1][8]['color'] = 'blue'

print '\nDraw out with matplotlib...'
nx.draw(G)
plt.show()

print '\nIterators...'
FG = nx.Graph()
FG.add_weighted_edges_from(
    [(1, 2, 0.125), (1, 3, 0.75), (2, 4, 1.2), (3, 4, 0.375), (1, 4, 0.175)])
for n, nbrs in FG.adjacency_iter():
    for nbr, attr in nbrs.items():
        if attr['weight'] < 0.5:
            print '(%d, %d, %.3f)' % (n, nbr, attr['weight'])

for (u, v, d) in FG.edges(data='weight'):
    if d < 0.5:
        print '(%d, %d, %.3f)' % (u, v, d)

print "\nAlgorithms operators..."
print approx.node_connectivity(G)
