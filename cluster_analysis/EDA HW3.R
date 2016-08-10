if(!require(gdata)){
  install.packages("gdata")
  library(gdata)
}

data <- read.csv("hw3data-3d.csv",header=FALSE)
myScatterInput <- data.frame(data)

n <- nrow(myScatterInput)
m <- ncol(myScatterInput)

data_2 <- read.csv("hw3param.csv",header=FALSE)
nReps <- data_2[1,1] 
myClusterNum <- data_2[1,2]
maxIter <- data_2[1,3]

f <- 0
repeat{
  all_dist <- data.frame()
  cluster_center <- data.frame()
  for (i in 1:myClusterNum){ 
    samp_row <- sample(1:n,1,replace=TRUE)
    samp <- myScatterInput[samp_row,]
    cluster_center<- rbind(cluster_center,samp)
  }

  y <- 0
  repeat {
    #Define a function calculate the distance btw each cluster center and all dataframe points
    b <- data.frame()
    distance <- data.frame(row.names = 1:n)
    for (j in 1:myClusterNum) {
      b <- data.frame()
      for (i in 1:n){
        a <- sqrt(sum((cluster_center[j,] - myScatterInput[i,])^2))
        b <- rbind(b,a)
      }
      distance <- cbind(distance,b)
    }

    #Find the minimum distance for each row, and return the index for further classifying
    inde_all <- sapply(1:n,function(x) which.min(distance[x,]))
    
    #Define a function for classify
    inde_clusters <- cbind(myScatterInput,inde_all)
    cluster_sort <- inde_clusters[order(inde_all),]

    cluster <- data.frame(NA)
    for (i in 1:myClusterNum) {
      a <- cluster_sort[which(cluster_sort$inde_all==i),1:m]
      cluster <- cbindX(cluster,a)
    }
    cluster <- cluster[-1]
    
    #Compute the centroid for each cluster, and get the new cluster centers
    new_center <- colMeans(cluster,na.rm = TRUE)
    new_center[is.nan(new_center)] <- 0
    newc <- new_center[1:m]
    for (i in 1:(myClusterNum-1)) {
      x_ <- new_center[(i*m+1):((i+1)*m)]
      newc <- rbind(newc,x_)
    }
    
    if (cluster_center[1,1] == newc[1,1]) {
      break
    }
    y <-  y + 1

    if (y == maxIter) {
      break
    }
    #Substitute old center with new centers
    cluster_center <- newc  
  }
  #compute the sum of all Euclidean distances from each point to their respective centroids.
  distance_2 <- data.frame(row.names = 1:nrow(cluster))
  cluster[is.na(cluster)] <- 0
  z <- 1
  for (i in 1:myClusterNum){
      b_2 <- data.frame()
      for (j in 1:nrow(cluster)){
        a_2 <- sqrt(sum((newc[i,1:m]-cluster[j,z:(i*m)])^2))
        b_2 <- rbind(b_2,a_2)
      }
    z <- z+m
    distance_2 <- cbind(distance_2,b_2)
  }
  sum_dist <- min(colSums(distance_2))
  f <- f+1
  if (f==nReps){
    break
  }
}
#Identify the replication with the lowest sum of Euclidean distances and print the value to the console
dists <- data.frame()
print(dists <- min(rbind(dists,sum_dist)))





