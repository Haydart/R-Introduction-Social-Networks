library(igraph)

# prepare network data
raw_graph_data = read.csv(file="social_network_graph_data.csv", header=FALSE, sep=" ")

graph_data <- raw_graph_data[3:nrow(raw_graph_data), 1:2]
str(graph_data)

raw_graph <- graph_from_data_frame(graph_data, directed=TRUE)
graph <- simplify(raw_graph)
#  Erdos-Renyi graph  graph <- erdos.renyi.game(p.or.m=.05, n=35, directed = TRUE)

# check if graph has 167 vertices & 5783 edges
print(vcount(graph))
print(ecount(graph))

# CONDUCT DISTRIBUTION SIMULATION

random_attempts_count <- 1
iterations_within_attempt <- 10
legend_descriptions <- lapply(c(1:iterations_within_attempt), paste0, " gen")
plot_file_names <- lapply(c(1:random_attempts_count), paste0, "attempt.jpg")
plot_colors <- c("black", "blanchedalmond", "blue", "blueviolet", "cyan", "darkgoldenrod1", "darkolivegreen1", "firebrick1", "deeppink", "lightskyblue")

for(attempt in 1:random_attempts_count) {
  print(paste(as.character(attempt), "attempt"))
  
  # mark all nodes as non-infected
  for(vertex_index in V(graph)) {
    V(graph)[vertex_index]$infected <- F
    V(graph)[vertex_index]$color <- "green"
  }
  
  # set a random node to be infected
  # first_infected_index <- sample(1:vcount(graph), 1)
  # print(random_index)
  
  # start infection from the node with highest betweenness value
  first_infected_index <- V(graph)[betweenness(graph) == max(betweenness(graph))]
  print(betweenness(graph))
  print(paste("The node with highest betweenness is ", first_infected_index))
  
  V(graph)[first_infected_index]$infected <- T
  V(graph)[first_infected_index]$color <- plot_colors[1]
  
  # create 0-init vertex size matrix where the source-of-infection node is 1
  size_matrix = matrix(0, nrow = vcount(graph), ncol = 1)
  size_matrix[first_infected_index, 1] <- 1
  
  infection_sources <- V(graph)[first_infected_index]
  
  # simulate 10 iterations of infection propagation
  for(index in 1:iterations_within_attempt) {
    
    neighbors_to_be_infected <- list()
    
    for(infection_source in infection_sources) {
      neighbors_to_be_infected <- union(neighbors_to_be_infected, neighbors(graph, V(graph)[infection_source], mode = "out"))
    }
    
    # rule out the nodes that were infected earlier
    neighbors_to_be_infected <- setdiff(neighbors_to_be_infected, V(graph)[infected == T])
    
    infection_sources <- neighbors_to_be_infected
    
    #infect neighbors of sampled nodes
    for(neighbor in neighbors_to_be_infected) {
      V(graph)[neighbor]$infected <- T
      V(graph)[neighbor]$color <- plot_colors[index+1]
    }
  } 
  
  # plot the graph after 10 propagation iterations & save it to file
  jpeg(as.character(plot_file_names[attempt]), width = 1280, height = 768)
  plot(graph, rescale = TRUE, ylim=c(-1, 1), xlim=c(-1.1, 0.9), edge.arrow.size = .5, asp = 0, 
       vertex.label=NA, vertex.size=2.5 + 1.5 * as.matrix(size_matrix), layout=layout.drl(graph), main = paste("Random attempt no. ", attempt))
  #plot(graph, vertex.size = 10)
  
  legend(-1.15, .75, y.intersp = .75, xjust = .5, yjust = .5, legend=as.vector(legend_descriptions), bty = "n", fill = plot_colors, cex=1.5)
  dev.off() 
}