install.packages("multiplex")
library(multiplex)
data = read.gml("/Users/macy/desktop/karate/karate.gml")
write.csv(data,"/Users/macy/desktop/network_graph.csv")


