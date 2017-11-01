library(igraph)

raw_graph_data = read.csv(file="social_network_graph_data.csv", header=FALSE, sep=" ")

graph_data <- raw_graph_data[3:nrow(raw_graph_data), 1:2]
str(graph_data)

raw_graph <- graph_from_data_frame(graph_data, directed=FALSE)
graph = simplify(raw_graph)

# check if graph has 167 vertices & 5783 edges
print(vcount(graph))
print(ecount(graph))

# CONDUCT DISTRIBUTION SIMULATION

# mark all nodes as non-infected
for(vertex_index in V(graph)) {
  V(graph)[vertex_index]$infected = F
}
print(V(graph)$infected)

# set a random node to be infected
random_index = sample(1:vcount(graph), 1)
V(graph)[random_index]$infected = T

plot(graph, rescale = TRUE, ylim=c(-.65,.65),xlim=c(-.65,.65), asp = 0, label=NA, vertex.size=5)

#infect neighbors of sampled node
for(neighbor in neighbors(graph, V(graph)[20])){
  V(graph)[neighbor]$infected=T
  V(graph)[neighbor]$color="red"
}




