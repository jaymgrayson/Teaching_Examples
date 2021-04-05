#Data Visualization session
#Jason M. Grayson
# March 15, 2021

rm(list=ls())
setwd("~/Desktop/Teaching_Examples")
install.packages("lattice)")
install.packages("gapminder")
# Graphics sytems in R: base, lattice, GGPLOT2
#Base
data("mtcars")
hist(mtcars$mpg)
plot(mtcars$mpg,mtcars$wt)
plot(mtcars)
#lattice 

library(lattice)
histogram(~ mpg, data = mtcars)
histogram(~ mpg|factor(cyl), data = mtcars)
xyplot(wt~ mpg|factor(cyl), data = mtcars)

library(tidyverse)
#Grammar of graphics idea (Leland Wilkinson)

#Examples from Data Visualization by Kieran Healy (Duke)
library(gapminder)
data("gapminder")
head(gapminder)

g1<-ggplot(data=gapminder)
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))
g1
g1<-g1+geom_point()
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))+geom_smooth()
g1
g1<-g1+geom_point()
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))+geom_smooth(method="lm")
g1
g1<-g1+geom_point()
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))
g1<-g1+geom_point()+geom_smooth(method="lm")+scale_x_log10()
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))
g1<-g1+geom_point()+geom_smooth(method="lm")+scale_x_log10(labels=scales::dollar)
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp,color=continent))
g1<-g1+geom_point()+geom_smooth(method="lm")+scale_x_log10(labels=scales::dollar)
g1
g1<-g1+ggtitle("Stop Now Jason")
g1
