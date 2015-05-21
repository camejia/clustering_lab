# See 6.00.2x Lab: K-Means from Week 7
# https://courses.edx.org/courses/MITx/6.00.2_2x/3T2014/courseware/edfd3922413e46368dceb9447a5e711d/8ee5730c00b54ef3ab0e6ab0541a682d/

# Distance metric
# Euclidean
# Initialization of centroids
# Initialize at a random position
# Simulation control
# of underlying Gaussians:  
# of means to initialize:  
# Generate new data
# Run the algorithm


nClustersSimulate <- 5

kClustersPartition <- 5

nPoints <- 60  # divisible up to 6
# nPointsPerClusterSimulated <- nPoints / nClustersSimulate

xOff <- rnorm(nPoints, mean = 0, sd = 0.05)
yOff <- rnorm(nPoints, mean = 0, sd = 0.05)

xCtr <- runif(nClustersSimulate)
yCtr <- runif(nClustersSimulate)

clusterIdSimulated <- seq(1, nClustersSimulate)

clusteredData <- data.frame(x = xOff + rep(xCtr), y = yOff + rep(yCtr),
                            clusterIdSimulated)

clusteredData$x[clusteredData$x < 0] <- 0
clusteredData$x[clusteredData$y < 0] <- 0
clusteredData$x[clusteredData$x > 1] <- 1
clusteredData$y[clusteredData$y > 1] <- 1

fit <- kmeans(clusteredData[, c("x", "y")], kClustersPartition)
clusteredData$clusterIdFit <- factor(fit$cluster)
clusteredData$clusterIdSimulated <- factor(clusteredData$clusterIdSimulated)

library(ggplot2)

ggplot(clusteredData, aes(x, y)) +
  aes(shape = clusterIdSimulated) +
  geom_point(aes(colour = clusterIdFit), size = 4) +
  ggtitle("Clustered Data") +
  xlim(-0.1, 1.1) + ylim(-0.1, 1.1)
