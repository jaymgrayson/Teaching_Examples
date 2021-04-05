# Problem Set 4
# Your Name

rm(list=ls())
library(tidyverse)
vgsales <- read_csv("vgsales.csv")
df<-vgsales
df_Sony<-filter(df, df$Publisher=="Sony Computer Entertainment")
g1<-ggplot(data=df_Sony, mapping=aes(x=Year,y=NA_Sales))+geom_point()
g1
g1<-g1+facet_wrap(~Genre)
g1
data("ChickWeight")
g2<-ggplot(data=ChickWeight, mapping=aes(x=Time,y=weight))+geom_point()
g2
g2<-ggplot(data=ChickWeight, mapping=aes(x=Time,y=weight))+aes(group=Chick)+geom_line()
g2
g2<-ggplot(data=ChickWeight, mapping=aes(x=Time,y=weight))+aes(group=Chick)+geom_line()+facet_wrap(~Diet)
g2
g2<-ggplot(data=ChickWeight, mapping=aes(x=Time,y=weight))+geom_line(aes(group=Chick))+facet_wrap(~Diet)+geom_smooth(method="lm")
g2
