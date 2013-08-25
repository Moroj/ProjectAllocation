#!/usr/bin/env python
import os
import networkx as nx
import csv

G = nx.DiGraph()
#f = open("/Users/morojalsulaimani/ProjectAllocation/app/views/allocs/report.txt", 'w')
f = open(os.path.realpath("app/views/allocs/report.txt"), 'w')
with open (os.path.realpath('app/views/allocs/inputs.csv'),'rU') as Data:
#with open("/Users/morojalsulaimani/ProjectAllocation/app/views/allocs/inputs.csv",'rb') as Data:
	reader = csv.reader(Data, delimiter=',', quoting=csv.QUOTE_NONNUMERIC)
	Students, C_Weight, Choice, P_Capacity, Academics, A_Capacity = zip(*reader)
	
academics = tuple(set(Academics))
source = tuple(set(Students))
count_sink = len(source)
count_source = len(source)
if count_source > 0 :
	count_source = -count_source;
	
Tm = len(Academics)
Sm = len(Students)
T = tuple('T' * Tm)
S = tuple('S' * Sm)
APA = tuple('P' * Tm)
APS = tuple('P' * Sm)

A_Capacity_dict = dict(zip(zip(Academics, T), A_Capacity))
P_Capacity_dict = dict(zip(zip(Choice, Academics),P_Capacity))
G.add_node('S', demand = count_source)
G.add_node('T', demand = count_sink)
	
List1 = zip(S, Students)
List2 = zip(Students, Choice, C_Weight)
List3 = zip(Choice, Academics, P_Capacity)
List4 = zip(Academics, T, A_Capacity)
List5 = zip(Students, APS)
List6 = zip(APA, Academics)
	
G.add_edges_from(List1, capacity= 1, weight= 1)
G.add_weighted_edges_from(List2, capacity= 1)
G.add_edges_from(P_Capacity_dict, weight=1)
for u,v,d in List3:
	G[u][v]['capacity']=d
G.add_edges_from(A_Capacity_dict, weight= 1)
for u,v,d in List4:
	G[u][v]['capacity']=d

G.add_edges_from(List5, capacity= 1, weight= 10)
G.add_edges_from(List6, capacity= 3, weight= 5)

flowCost, flowDict = nx.network_simplex(G)
print "Optimum: %s" %flowCost
for u, v in sorted(G.edges_iter()):
	print('(%s, %s) %.2f' % (u, v, flowDict[u][v]))
	
r = str(flowCost)
f.write("Flow Cost: ")
f.write(r)

f.write('\nFlowDict: \n')
for u, v in sorted(G.edges_iter()):
	f.write('(%s, %s) %.2f \n' % (u, v, flowDict[u][v]))
f.close()