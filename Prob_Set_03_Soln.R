# Problem Set 3 Solution
# JMG
#03/16/2021

rm(list=ls())
library(tidyverse)
library(visdat)
JG_Collection <- read_csv("JG Collection.csv")
df<-JG_Collection
# Replace manuallly
df[5,6]<-"10"
df$Penciler<-as.factor(df$Penciler)
df$Penciler[df$Penciler=="Jon Byne"]<-"John Bryne"
levels(df$Penciler)<-c(levels(df$Penciler),"Jim Aparo")
df$Penciler[df$Penciler=="Aparo"]<-"Jim Aparo"
df[14,3]<-"428"
df[7,7]<-"3300"
df[8,7]<-"850"
vis_dat(df)
df<-replace_na(df, list(Value=110))
vis_dat(df)
df$Value<-as.numeric(df$Value)
df$JG_Score<-as.numeric(df$JG_Score)
df<-arrange(df,JG_Score,Value)
