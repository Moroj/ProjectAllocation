#!/usr/bin/env python
import os
import networkx as nx
import sqlite3
import csv
import sys


G = nx.DiGraph()
f = open("/Users/morojalsulaimani/ProjectAllocation/app/views/allocs/report.txt", 'wb')
with open("/Users/morojalsulaimani/ProjectAllocation/app/views/allocs/inputs.csv",'rb') as Data:
	reader = csv.reader(Data, delimiter=',', quoting=csv.QUOTE_NONNUMERIC)
	Student_id, C_Weight, Choice, P_Capacity, Academic_id, A_Capacity = zip(*reader)
	
academics = tuple(set(Academic_id))
source = tuple(set(Student_id))
count_sink = len(source)
count_source = len(source)
if count_source > 0 :
	count_source = -count_source;
	
Tm = len(Academic_id)
Sm = len(Student_id)
T = tuple('T' * Tm)
S = tuple('S' * Sm)
A_Capacity_dict = dict(zip(zip(Academic_id, T), A_Capacity))
P_Capacity_dict = dict(zip(zip(Choice, Academic_id),P_Capacity))
G.add_node('S', demand = count_source)
G.add_node('T', demand = count_sink)
	
List1 = zip(S, Student_id)
List2 = zip(Student_id, Choice, C_Weight)
List3 = zip(Choice, Academic_id, P_Capacity)
List4 = zip(Academic_id, T, A_Capacity)
	
G.add_edges_from(List1, capacity= 1, weight= 1)
G.add_weighted_edges_from(List2, capacity= 1)
G.add_edges_from(P_Capacity_dict, weight=1)
for u,v,d in List3:
	G[u][v]['capacity']=d
G.add_edges_from(A_Capacity_dict, weight= 1)
for u,v,d in List4:
	G[u][v]['capacity']=d

flowCost, flowDict = nx.network_simplex(G)
print "Optimum: %s" %flowCost
print "Simplex_Flow_Dict: %s" %flowDict

mincostFlow = nx.max_flow_min_cost(G, 'S', 'T')
print "Max_flow_min_cost: %s" %mincostFlow
r = str(mincostFlow)
f.write("Max_flow_min_cost: ")
f.write(r)
	
	
flowDict = nx.min_cost_flow(G)
print "Min_cost_flow: %s" %flowDict
	
flowCost = nx.min_cost_flow_cost(G)
print "Min_cost_flow_cost(FlowCost): %s" %flowCost
		

