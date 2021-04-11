library(Seurat)
library(SeuratData)
library(SeuratDisk)
setwd("~/Desktop/Deep_Dive/Farber_scmrna_data")
Convert("COV022A1.h5ad",dest="h5seurat",overwrite = TRUE)
COVID_1<-LoadH5Seurat("COV022A1.h5seurat")
COVID_1
