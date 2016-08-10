if (!require(scatterplot3d)) {
    source("http://bioconductor.org/biocLite.R")
    biocLite("scatterplot3d")
    library(scatterplot3d)
}

# kmeans algorithm
macy.kmeans <- function(nReps, myScatterInput, myClusterNum, maxIter) {
    # seed start point
    seedStart <- 1000

    # row and column number of dataset
    rows <- nrow(myScatterInput)
    cols <- ncol(myScatterInput)

    matrixInput <- apply(matrix(myScatterInput), 1, function(r) {
        return(do.call(c, r))
    })
    sumDistance <- -1
    bestCluster <- matrix(0, nrow = rows, ncol = 2)
    bestCenters <- matrix(0, myClusterNum, cols)
    for (r in 1 : nReps) {
        # random row index
        set.seed(seedStart + r)
        randomNum <- as.vector(sample(1 : rows, myClusterNum))

        # store cluster for each data belongs to
        belongCluster <- matrix(0, nrow = rows, ncol = 2)

        # initial centers
        centers <- matrix(0, myClusterNum, cols)
        for (i in 1 : myClusterNum) {
            centers[i, ] <- matrixInput[randomNum[i], ]
            centers <- matrix(centers, myClusterNum, cols)
            belongCluster[randomNum[i], 1] <- i
        }

        times <- 0
        changed <- TRUE

        repeat {
            if (times >= maxIter || !changed) {
                break
            }
            times <- times + 1
            changed <- FALSE
            for (i in 1 : rows) {
                minDistance <- -1
                previousCluster <- belongCluster[i, 1]
                from <- matrixInput[i, ]

                # find the cluster for each data belongs to
                for (n in 1 : myClusterNum) {
                    to <- centers[n, ]
                    currentDistance <- sum((from - to) ^ 2)
                    if (minDistance < 0 || currentDistance < minDistance) {
                        minDistance <- currentDistance
                        belongCluster[i, 1] <- n
                        belongCluster[i, 2] <- currentDistance
                    }
                }

                # assert if clusters changed
                if (previousCluster != belongCluster[i, 1]) {
                    changed <- TRUE
                }
            }

            # adjust center points
            for (m in 1 : myClusterNum) {
                clusterMatrix <- as.matrix(matrixInput[belongCluster[, 1] == m, ])
                if (nrow(clusterMatrix) > 0) {
                    centers[m, ] <- matrix(colMeans(clusterMatrix))
                }
            }
        }

        # get the best cluster
        distance <- sum(belongCluster[, 2])
        if (sumDistance < 0 || distance < sumDistance) {
            sumDistance <- distance
            bestCluster <- belongCluster
            bestCenters <- centers
        }
    }

    print(sum(sqrt(bestCluster[, 2])))
    if (cols == 2) {
        plot(matrixInput, col = bestCluster[, 1])
        points(bestCenters, col = 1 : myClusterNum, pch = 23, cex = 3)
    } else if (cols == 3) {
        scatterplot3d(matrixInput, color = bestCluster[, 1])
    }
}

myScatterInput <- read.csv("hw3data-3d.csv", header = FALSE)

params <- read.csv("hw3param.csv", header = FALSE)
nReps <- params[1, 1]
myClusterNum <- params[1, 2]
maxIter <- params[1, 3]

macy.kmeans(nReps, myScatterInput, myClusterNum, maxIter)
