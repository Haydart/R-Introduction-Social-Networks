library(igraph)

raw_graph_data = read.csv(file="social_network_graph_data.csv", header=FALSE, sep=" ")

graph_data = raw_graph_data[3:nrow(raw_graph_data), 1:2]
str(graph_data)