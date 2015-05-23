library(deldir)
library(ggplot2)
library(shiny)

nPoints <- 60  # Evenly divisible up to 6

set.seed(2)

shinyServer(
  function(input, output) {
    dataInput <- reactive({
      xOff <- rnorm(nPoints, mean = 0, sd = 0.05)
      yOff <- rnorm(nPoints, mean = 0, sd = 0.05)
      
      xCtr <- runif(input$nClustersSimulate)
      yCtr <- runif(input$nClustersSimulate)
      
      clusterIdSimulated <- seq(1, input$nClustersSimulate)
      
      clusteredData <- data.frame(x = xOff + rep(xCtr), y = yOff + rep(yCtr),
                                  clusterIdSimulated)
      
      clusteredData$x[clusteredData$x < 0] <- 0
      clusteredData$y[clusteredData$y < 0] <- 0
      clusteredData$x[clusteredData$x > 1] <- 1
      clusteredData$y[clusteredData$y > 1] <- 1
      
      clusteredData
    })
    
    output$newClusterData <- renderPlot({
      clusteredData <- dataInput()
      
      fit <- kmeans(clusteredData[, c("x", "y")], input$kClustersFit)
      clusteredData$clusterIdFit <- factor(fit$cluster)
      clusteredData$clusterIdSimulated <- factor(clusteredData$clusterIdSimulated)

      voronoi <- deldir(fit$centers[, 1], fit$centers[, 2])
      
      ggplot() +
        # Plot the points
        geom_point(data = clusteredData,
                   aes(x = x, y = y,
                       shape = clusterIdSimulated,
                       colour = clusterIdFit),
                   size = 4) +
        # Plot the voronoi lines
        geom_segment(data = voronoi$dirsgs,
                     aes(x = x1, y = y1, xend = x2, yend = y2)) +
        ggtitle("Clustered Data") +
        xlim(-0.1, 1.1) + ylim(-0.1, 1.1)
    })
  }
)
