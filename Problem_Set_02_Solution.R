# Problem Set for R Session #02
# Jason M. Grayson
# Started 02-219-2021
# How to get workspace cleared?
rm(list=ls())
#How to set your working directory?
setwd("~/Desktop/Teaching_Examples")

#What libraries do you need to complete work below?
library(data.table)
library(visdat)
library(tidyverse)

# Load productivity data from the following link:
# https://www.stats.govt.nz/assets/Uploads/Productivity-statistics/Productivity-statistics-19782020/Download-data/productivity-statistics-1978-2020-csv.csv

Productivity_Url<-"https://www.stats.govt.nz/assets/Uploads/Productivity-statistics/Productivity-statistics-19782020/Download-data/productivity-statistics-1978-2020-csv.csv"
mydat <- fread(Productivity_Url)

# Visualize any gaps in the dataset
vis_dat(mydat)

#Using select on take the columns that do NOT have NAs
mydat_complete<-select(mydat,-12,-13)

#Filter Data_values greater than 100
mydat_complete_g100<-filter(mydat_complete,Data_value>=100)
# How do you get results that have FINAL STATUS?
mydat_complete_g100f<-filter(mydat_complete_g100,STATUS=="FINAL")
# How do you group data by Series_reference?
mydat_complete_g100fg<-group_by(mydat_complete_g100f,Series_reference)
# What is the mean Data_value for each Series_reference?
mean_mydat<-summarise(mydat_complete_g100fg,Mean_Series=mean(Data_value))

#Log transform the data as new column
Log_transformed_values<-mutate(mean_mydat,Log=log10(Mean_Series))
Arranged<-arrange(Log_transformed_values,desc(Mean_Series))

# Now do it all in one command!
Arranged_Elegant<-mydat %>%select(-12,-13)%>%
    filter(Data_value>=100)%>%
    filter(STATUS=="FINAL")%>%
    group_by(Series_reference)%>%
    summarise(Mean_Series=mean(Data_value))%>%
    mutate(mean_mydat,Log=log10(Mean_Series))%>%
    arrange(desc(Mean_Series))
