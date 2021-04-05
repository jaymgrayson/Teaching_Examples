# Teaching R Script
# Jason M Grayson
# Started 02-08-2021

#Use comments wisely (5 years, 5 minutes)

# Some R computerese issues
# R Still thinks its 1970

#getwd()
#setwd("")
ls()
rm()
save(x,file="x.Rda")
load(file="x.Rda")

install.packages("")
library()

#Data Types and Objects
#Wipe command
rm(list=ls())
#Assignment operator
x<-5
#Data types
# R atomic types-logical,integer,numeric,complex,character
#R data-types-scalar,vector, matrix, arrays, dataframe, lists, table/tibbles, factors
x<-6
typeof(x)
y<-TRUE
z<-"Hello"
rm(list=ls())

#R data-types-scalar,vector, matrix, arrays, dataframe, lists, table/tibbles, factors
#Make a vector
JMG<-c(03,24,69)
ETG<-c(09,20,72)
#Vector manipulation
Grayson_Bros<-c(JMG,ETG)
Demo_Vector1<-rep(JMG,times=3)
Demo_Vector1a<-rep(JMG,each=3)
Demo_Vector1b<-rep(JMG,each=3,times=3)
Demo_Vector2<-seq(from=1965, to=1980,by=1)
SP_Kids<-c(1972,1969,1967,1973)
SP_Kids_Sorted<-sort(SP_Kids)
#Subsetting vector, R starts at 1
Oldest_SP_Kid<-SP_Kids_Sorted[1]

M<-matrix(1:20,nrow = 5,ncol = 4)
A<-array(1:40,dim=c(5,4,2))
M
A

Name<-c("Jason","Ethan")
Month<-c(3,9)
Day<-c(24,20)
Year<-c(1969,1972)
State<-c("NC","MD")

#Making a dataframe, the core R data object
df<-cbind(Name,Month,Day,Year,State)
typeof(df)
df<-as.data.frame(df)
typeof(df)
Height<-c(72,67)
City<-c("Winston-Salem","Pasadena")
df<-cbind(df,Height,City)
# A list is a bag of everything
BOE<-list(Height,City,df)
data("iris")
iris
head(iris)
tail(iris)
First_Entry<-iris[1,1]
First_Entry
str(iris)
data(mtcars)
mtcars
Gas_Guzzlers<-mtcars[mtcars$mpg<="12",]
save(Gas_Guzzlers,file="Gas_Guzzlers.Rda")
rm(list=ls())
load(file="Gas_Guzzlers.Rda")

#biological examples
library(flowCore)
setwd("~/Desktop/121520_All/121520S")
Flow_Data<-read.FCS(file="Specimen_001_Tube_001_019.fcs")
Flow_Data<-exprs(Flow_Data)
Flow_Data<-as.data.frame(Flow_Data)
