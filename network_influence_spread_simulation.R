library(igraph)

# prepare network data
raw_graph_data = read.csv(file="social_network_graph_data.csv", header=FALSE, sep=" ")

graph_data <- raw_graph_data[3:nrow(raw_graph_data), 1:2]
str(graph_data)

raw_graph <- graph_from_data_frame(graph_data, directed=TRUE)
graph <- simplify(raw_graph)

# check if graph has 167 vertices & 5783 edges
print(vcount(graph))
print(ecount(graph))

# CONDUCT DISTRIBUTION SIMULATION

iterations = 10
legend_descriptions <- lapply(c(1:iterations), paste0, " gen")
plot_colors <- c("black", "blanchedalmond", "blue", "blueviolet", "cyan", "darkgoldenrod1", "darkolivegreen1", "firebrick1", "deeppink", "lightskyblue")
plot_file_names <- lapply(legend_descriptions, paste0, ".jpg")

#plot_file_names <- lapply(plot_file_names, paste0, ".jpg")

# mark all nodes as non-infected
for(vertex_index in V(graph)) {
  V(graph)[vertex_index]$infected = F
  V(graph)[vertex_index]$color = "green"
}
print(V(graph)$infected)

# set a random node to be infected
random_index <- sample(1:vcount(graph), 1)
print(random_index)
V(graph)[random_index]$infected <- T
V(graph)[random_index]$color <- plot_colors[1]

# create 0-init vertex size matrix where the source-of-infection node is 1
size_matrix = matrix(0, nrow = vcount(graph), ncol = 1)
size_matrix[random_index, 1] <- 1

# simulate 10 iterations
for(index in 1:iterations) {
  
  print(index)
  
  #infect neighbors of sampled node
  for(neighbor in neighbors(graph, V(graph)[random_index])) {
    V(graph)[neighbor]$infected <- T
    V(graph)[neighbor]$color <- plot_colors[2]
  }
  
  # plot the graph & save it to image
  jpeg(as.character(plot_file_names[index]), width = 1280, height = 768)
  plot(graph, rescale = TRUE, ylim=c(-1,1), xlim=c(-1.1,0.9), edge.arrow.size = .15, asp = 0, 
       vertex.label=NA, vertex.size=2.5 + 1.5 * as.matrix(size_matrix), layout=layout.drl(graph))
  
  legend(-1.15, .75, y.intersp = .75, xjust = .5, yjust = .5, legend=as.vector(legend_descriptions), bty = "n", fill = plot_colors, cex=1.5)
  dev.off() 
}

