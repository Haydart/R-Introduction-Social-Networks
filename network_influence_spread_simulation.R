library(igraph)

raw_graph_data = read.csv(file="social_network_graph_data.csv", header=FALSE, sep=" ")

graph_data <- raw_graph_data[3:nrow(raw_graph_data), 1:2]
raw_graph <- graph_from_data_frame(graph_data)
graph = simplify(raw_graph)

# check if graph has 167 vertices & 5783 edges
print(vcount(graph))
print(ecount(graph))

str(graph_data)