library(shiny)

shinyUI(fluidPage(
  titlePanel("Clustering Laboratory"),
  
  sidebarLayout(
    sidebarPanel(
      h3('Clustering Parameters'),
      h4("Documentation:"),
      "Use the Clusters to Simulate slider to generate new data with the specified number of clusters.",
      sliderInput('nClustersSimulate', 'Clusters to Simulate', 4, min = 1, max = 6, step = 1),
      "Use the Clusters to Fit slider to fit the specified number of cluster to the current data (i.e. without simulating new data).",
      sliderInput('kClustersFit', 'Clusters to Fit', 4, min = 1, max = 6, step = 1),
      "Note: The choice of symbol indicates which cluster the point was a simulated to be a member of,",
      " and the choice of color indicates which cluster the K-Means algorithm assigned the point to."
    ),
    mainPanel(
      h3('Clustering Calculation Display'),
      "Here is the result of the server calculation:",
      plotOutput('newClusterData')
    )
  )
))
