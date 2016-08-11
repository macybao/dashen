from pandas import *
from numpy import *

G = read_csv("/Users/macy/desktop/network_graph.csv",)
s = G['S']
t = G['T']
r = G['R']

length = 78

def get_matrix(s,t,r):
    A = zeros((34, 34))
    for q in range(1,78):
        for col in range(34):
            for row in range(34):
                if s[q] == col and r[q] == row:
                    A[row,col] = t[q]
                else:
                    A[row,col] = 0
    return A

print get_matrix(s,t,r)





#print graph

#print G
# import networkx as nx
# G = nx.read_gml("/Users/macy/desktop/karate/karate.gml",)
# pr = G.node
#
# GM = nx.google_matrix(G)
# print GM