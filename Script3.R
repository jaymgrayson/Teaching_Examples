#Data wrangling continued
#Jason M. Grayson
# Started 02-21-2021

rm(list=ls())
setwd("~/Desktop/Teaching_Examples")
library(visdat)
library(tidyverse)

#load data we want
AD_CSV <- read_csv("AD_CSV.csv")
#visualize gaps
vis_dat(AD_CSV)
#remove gaps
AD_complete<-na.omit(AD_CSV)
vis_dat(AD_complete)
#convert to tibble
AD_complete<-as_tibble(AD_complete)
AD_complete
#coerce variable to what we want
df<-AD_complete
df$Pt<-as.factor(df$Pt)
vis_dat(df)
df[c("Pt","Sex","Cognitive_Status","Amyloid Read","Disease_Classifier")]<-lapply(df[c("Pt","Sex","Cognitive_Status","Amyloid Read","Disease_Classifier")],as.factor)
vis_dat(df)
df
df$Draw_Date<-as.Date.character(df$Draw_Date,"%m/%d/%y")
vis_dat(df)
