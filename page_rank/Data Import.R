if (!require(multiplex)) {
    install.packages("multiplex", repos="http://cran.rstudio.com/")
    library(multiplex)
}
data = read.gml( "/Users/Jiang/Documents/Develop/GitHub/dashen/page_rank/karate.gml")
write.csv(data, "/Users/Jiang/Documents/Develop/GitHub/dashen/page_rank/network_graph.csv", row.names = FALSE)


