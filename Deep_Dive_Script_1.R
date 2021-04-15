#Goal: Convert h5ad to h5seurat for use with Seurat R package for scmRNA analysis
# Jason M. Grayson
#Most recent version 4-15-2021
library(Seurat)
library(SeuratData)
library(SeuratDisk)
#Set wd to where your copy of the h5ad files are
setwd("~/Desktop/Deep_Dive/Modified_files")
rm(list=ls())
list.filenames <- list.files(pattern=".h5ad$")
print(list.filenames)
for (i in seq_along(list.filenames))
{
    name<-list.filenames[i]
    Convert(name,dest="h5seurat",overwrite = TRUE)   
}
H5seurat_files<-list.files(pattern=".h5seurat$")
print(H5seurat_files)

