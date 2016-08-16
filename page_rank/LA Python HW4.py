import pandas as pd
import numpy as np

probability = 0.15
total_times = 10

G = pd.read_csv("/Users/Jiang/Documents/Develop/GitHub/dashen/page_rank/network_graph.csv")
s = G['S']
t = G['T']
r = G['R']
length = len(s)
number = max(s)
E = np.divide(np.ones((number, number)), number)

def get_init_matrix(s, t, r):
    m = np.zeros((number, number))
    for q in range(1, length):
        m[s[q] - 1][r[q] - 1] = t[q]
    for i in range(number):
        s = np.sum(m[i])
        if s != 0:
            m[i] = np.divide(m[i], s)
    return m


def page_rank(P, q, times):
    R = np.ones((number, 1))
    Pt = np.transpose(P)
    A = np.add(np.multiply(Pt, 1 - q), np.multiply(E, q))
    print A
    for t in range(times):
        R = np.dot(A, R)
    return R


P = get_init_matrix(s, t, r)
result = page_rank(P, probability, total_times)
print result


# import networkx as nx

# G = nx.read_gml("/Users/Jiang/Documents/Develop/GitHub/dashen/page_rank/karate.gml",)
# pr = G.node

# GM = nx.google_matrix(G)
# print GM
