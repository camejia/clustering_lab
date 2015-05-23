Clustering Laboratory
========================================================
author: Christopher A. Mejia
date: Sat May 23 11:46:30 2015
transition: rotate

Motivation
========================================================

<small>
K-Means Clustering:
- Is an important tool in Data Science
- Is taught as part of the Exploratory Data Analysis class in the Coursera Data Science Specialization
- Allows the Data Scientist to discover groupings in data
 
Example: Clustering integers from 1 to 10 results in two groupings:


```r
kmeans(seq(1, 10), 2)$cluster
```

```
 [1] 2 2 2 2 2 1 1 1 1 1
```
Unfortunately, text input and output is not very informative.
Better graphical learning aids for K-Means Clustering are needed to teach budding Data Scientists how to use this powerful technique.
</small>

Sample Output
========================================================

The Clustering Laboratory is an interactive Shiny application that allows the Data Scientist to simulate a numbers of clusters and experiment with fitting a (possibly different) number of clusters to the data.  A sample output plot is shown here:

***

![plot of chunk unnamed-chunk-2](clustering_lab-figure/unnamed-chunk-2-1.png) 

Comparing the Clustering Laboratory to Similar Tools
========================================================
incremental: true

The Clustering Laboratory is similar to (and in fact was inspired by) an K-Means Lab presentented in the edX/MITx course 6.002x "Introduction to Computational Thinking and Data Science".  However, the Clustering Laboratory is superior to the edX K-Means Lab for the following reasons:

- The edX K-Means Lab was used as part of a course on Python, whereas the Clustering Laboratory is implemented in R.  It is a well-known fact that R is the one true language for Data Science.
- The Clustering Laboratory is deployed using Shiny, whereas the edX tool is deployed using something else (i.e. something that is not as shiny)

Summary
========================================================

- K-Means Clustering is an important tool in Data Science
- The Clustering Laboratory is an effective tool for teaching K-Means Clustering
- Head over to RPubs and check out the [http://camejia.shinyapps.io/clustering_lab](http://camejia.shinyapps.io/clustering_lab) today!
- If you want to become part of the Clustering Laboratory Development Team, fork [https://github.com/camejia/clustering_lab](https://github.com/camejia/clustering_lab), make code contributions, and submit a pull request!
