import networkx as nx

G = nx.read_gml("/Users/Jiang/Documents/Develop/GitHub/dashen/page_rank/karate.gml")
pr = nx.pagerank(G, alpha=0.9)
print pr
