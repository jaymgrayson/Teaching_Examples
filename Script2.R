# Teaching R Script Session #2
# Jason M Grayson
# Started 02-15-2021

rm(list=ls())
setwd("~/Desktop/Teaching_Examples")

library(tseries)
library(readxl)
library(readr)
library(data.table)
library(visdat)
# Today's goal is to learn how to import different data formats and start to
# manipulate it
#Bring in built-in data
data("mtcars")
#install.packages("tseries")/install package and use its data
data("ice.river")
#read in excel data

JMG_AD_Data <- read_excel("JMG_AD_Data.xlsx")
View(JMG_AD_Data) 
#read in csv
JMG_AD_CSV <- read_csv("JMG_AD_CSV.csv")
View(JMG_AD_CSV)
#read.table()
#download and read data from the web
Business_Url<-"https://www.stats.govt.nz/assets/Uploads/Business-operations-survey/Business-operations-survey-2019/Download-data/business-operations-survey-2019-international-engagement-csv.csv"
download.file(Business_Url,destfile = "Bus_Ops.csv")
Business_Data<-read_csv(file="Bus_Ops.csv")
#download and read data from the web directly
mydat <- fread(Business_Url)
head(mydat)

# Data cleaning and filtering
rm(list=ls())
JMG_AD_CSV <- read_csv("JMG_AD_CSV.csv")
View(JMG_AD_CSV)
vis_dat(JMG_AD_CSV)

#Tidy Data (draw example!!!)
#From Machine Learning With R, the tidyverse, and mlr
library(tidyverse)
data(iris)
iris_t<-as_tibble(iris)
iris
iris_t
JMG_tibble<-as_tibble(JMG_AD_CSV)
JMG_tibble
rm(list=ls())
#manipulating data with tidyverse
data("CO2")
CO2tib <- as_tibble(CO2)
CO2tib
vis_dat(CO2tib)
selectedData <- select(CO2tib, 1, 2, 3, 5)
selectedData
filteredData <- filter(selectedData, uptake > 16)
filteredData
groupedData <- group_by(filteredData, Plant)
groupedData
summarizedData <- summarize(groupedData, meanUp = mean(uptake),
                            sdUp = sd(uptake))
summarizedData
mutatedData <- mutate(summarizedData, CV = (sdUp / meanUp) * 100)
mutatedData
arrangedData <- arrange(mutatedData, CV)
arrangedData
# Say hello to my little friend %>%!
arrangedData2 <- CO2tib %>%
    select(c(1:3, 5)) %>%
    filter(uptake > 16) %>%
    group_by(Plant) %>%
    summarize(meanUp = mean(uptake), sdUp = sd(uptake)) %>%
    mutate(CV = (sdUp / meanUp) * 100) %>%
    arrange(CV)
arrangedData2
