library(Seurat)
library(SeuratData)
library(SeuratDisk)
setwd("~/Desktop/Deep_Dive/Modified_files")
rm(list=ls())
#Convert("COV022A1.h5ad",dest="h5seurat",overwrite = TRUE)

list.filenames <- list.files(pattern=".h5ad$")
print(list.filenames)
list.data<-list()
for (i in seq_along(list.filenames))
{
    name<-list.filenames[i]
    Convert(name,dest="h5seurat",overwrite = TRUE)   
}
H5seurat_files<-list.files(pattern=".h5seurat$")
print(H5seurat_files)

