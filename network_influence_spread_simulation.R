library(igraph)

raw_graph_data = read.csv(file="social_network_graph_data.csv", header=FALSE, sep=" ")

graph_data <- raw_graph_data[3:nrow(raw_graph_data), 1:2]
str(graph_data)

raw_graph <- graph_from_data_frame(graph_data, directed=TRUE)
graph = simplify(raw_graph)

# check if graph has 167 vertices & 5783 edges
print(vcount(graph))
print(ecount(graph))

# CONDUCT DISTRIBUTION SIMULATION

# mark all nodes as non-infected
for(vertex_index in V(graph)) {
  V(graph)[vertex_index]$infected = F
  V(graph)[vertex_index]$color = "green"
}
print(V(graph)$infected)

# set a random node to be infected
random_index = sample(1:vcount(graph), 1)
print(random_index)
V(graph)[random_index]$infected = T
V(graph)[random_index]$color = "black"

# create 0-init matrix where the source-of-infection node is 1
size_matrix = matrix(0, nrow = vcount(graph), ncol = 1)
size_matrix[random_index, 1] <- 1

iterations = 10
v <- rep("Gen", iterations)
legend_descriptions <- c(1:10)
legend_descriptions <- lapply(legend_descriptions, paste0, " gen")
legend_descriptions
iteration_colors = c("black", "blanchedalmond", "blue", "blueviolet", "cyan", "darkgoldenrod1", "darkolivegreen1", "firebrick1", "deeppink", "lightskyblue")

#infect neighbors of sampled node
for(neighbor in neighbors(graph, V(graph)[random_index])) {
  V(graph)[neighbor]$infected=T
  V(graph)[neighbor]$color="red"
}

plot(graph, rescale = TRUE, ylim=c(-1,1), xlim=c(-1.1,0.9), edge.arrow.size = .15, asp = 0, 
     vertex.label=NA, vertex.size=2.5+3*as.matrix(size_matrix), layout=layout.drl(graph))

legend(-1.15, .75, y.intersp = .75, xjust = .5, yjust = .5, legend=as.vector(legend_descriptions), fill = iteration_colors, cex=0.8)

