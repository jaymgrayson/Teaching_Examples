# Other repositories
#Jason M. Grayson
# Started 04/06/2021

rm(list=ls())
setwd("~/Desktop/Teaching_Examples")
library(devtools)
#install_github("immunogenomics/harmony")

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(version = "3.12")

#BiocManager::install("flowCore")
