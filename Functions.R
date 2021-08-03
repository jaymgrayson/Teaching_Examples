#Functions
# Jason M. Grayson
# Started 08/08/21

rm(list=ls())
library(tidyverse)
library(Rtsne)

data(iris)
head(iris)
iris_labels<-iris$Species
iris<-iris[,-c(5)]
tsne_iris<-Rtsne(iris,dim=2,perplexity=30,pca=FALSE,check_duplicates=FALSE)
V1_V2<-tsne_iris$Y
iris<-cbind(iris,iris_labels,V1_V2)


rm(list=ls())
data(iris)
head(iris)
iris_labels<-iris$Species
iris<-iris[,-c(5)]
tsne_iris<-Rtsne(iris,dim=2,perplexity=30,pca=FALSE,check_duplicates=FALSE,planets=9)
V1_V2<-tsne_iris$Y
iris<-cbind(iris,iris_labels,V1_V2)

rm(list=ls())
Hello_World<-function(){
    print("Hello World")
}
Hello_World()

rm(list=ls())
Hello_World<-function(){
    print("Hello World")
    return(x)
}
Hello_World()

rm(list=ls())
Hello_Add<-function(x,y){
    z=x+y
    return(z)
    a=x-y
}
x=3
y=4
b<-Hello_Add(x,y)
b
b<-Hello_Add()

rm(list=ls())
Hello_Add<-function(x=3,y=5){
    z=x+y
    z<-return(z)
    a=x-y
}
b<-Hello_Add(x,y)

rm(list=ls())
Hello_Add<-function(x=3,y=5){
    z=x+y
    return(z)
    a=x-y
}
x=6
y=9
b<-Hello_Add(x,y)
b
c<-Hello_Add(x,y,i)
