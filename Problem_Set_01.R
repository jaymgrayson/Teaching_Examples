# Problem Set #1-Potential Solutions
# Jason M Grayson
# Started 02-15-2021

rm(list=ls())
setwd("~/Desktop/Teaching_Examples")

#1.	What kind of computer language is R?
# Interpreted

#2.	What are 4 R packages that are already installed on your computer?
# abind, ade4, ape,arules

#3.	Create an object to store your age.
JMG_Age<-52
JMG_Age
#4.	Overwrite with your sibling’s age.
JMG_Age<-49
JMG_Age
#5.	Create a vector with a sequence of values of -5 to 50 that increments by 0.5.
Num_vector<-seq(from=-5, to=50, by=0.5)
Num_vector
#6.	What is the 20th element of this vector?
Twentieth_element_nv<-Num_vector[20]
Twentieth_element_nv

#7.	Use the islands dataset in sort function, what is the 7th largest “island”?
data("islands")
Sorted_Islands<-sort(islands,decreasing = TRUE)
Sorted_Islands
Seventh_Largest<-Sorted_Islands[7]
Seventh_Largest
