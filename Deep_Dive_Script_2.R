#Goal: Analyze Seurat objects from Farber lab COVID study
# Jason M Grayson
# Most recent version 4-15-2021
rm(list=ls())
library(Seurat)
library(SeuratData)
library(SeuratDisk)
setwd("~/Desktop/Deep_Dive/Modified_files")
#Now load Seurat object (container to store scmrna seq data and metadata)
COVID_data<-LoadH5Seurat("COV022A1.h5seurat")
#Interrogate like any other Seurat object
# How many pieces of data (cells) in object
table(Idents(COVID_data))
#What meta data are accessible
head(COVID_data@meta.data)
# Standard Info about object
head(COVID_data)
COVID_data
# Pull genenames on counts data
all_gene_names <- rownames(COVID_data)
# The [[ operator can add columns to object metadata. This is a great place to stash QC stats. This is straight out of the Seurat starting tutorial
COVID_data[["percent.mt"]] <- PercentageFeatureSet(COVID_data, pattern = "^MT-",assay="RNA")
# Will give Error: Cannot find 'nCount_RNA' in this Seurat object
#Visualize data
UMAPPlot(COVID_data)
#Should give a plot, but I dont think it is performing UMAP on the data, it is pulling the UMAP values the Farber already calculated.
