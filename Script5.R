#Data Visualization session #2
#Jason M. Grayson
# March 23, 2021
rm(list=ls())
library(tidyverse)
setwd("~/Desktop/Teaching_Examples")
library(gapminder)
data("gapminder")
head(gapminder)
#How do we build a visualization?
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))
g1
g1<-g1+geom_point()
g1
# You control everything
g1<-g1+geom_smooth(method="lm")+scale_x_log10(labels=scales::dollar)
g1
g1<-g1+ggtitle("OECD Life Expectancy")
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))
g1<-g1+geom_point(size=9,alpha=0.01)
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))
g1<-g1+geom_point(size=9,alpha=0.1)
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))
g1<-g1+geom_point(size=3,alpha=0.25)
g1
g1<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp))
g1<-g1+geom_point(size=3,alpha=0.25)
g1<-g1+geom_smooth(method="lm")+scale_x_log10(labels=scales::dollar)+ggtitle("OECD Life Expectancy")
g1
g1<-g1+theme(plot.title = element_text(hjust=0.5))
g1
g1<-g1+xlab("GDP Per Capita")+ylab("Life Expectancy")
g1
# Save for publication
ggsave(filename = "OECD.png")
ggsave(filename = "OECD.pdf")
g2<-ggplot(data=gapminder,mapping=aes(x=gdpPercap,y=lifeExp)) + 
geom_point(size=3,alpha=0.25)+theme_bw()+theme(panel.border = element_blank(), panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+ 
ggtitle("OECD Life Expectancy") + theme(plot.title = element_text(hjust = 0.5))+ 
xlab("GDP Per Capita")+ylab("Life Expectancy")
g2
g2<-g2+geom_smooth(method="lm")+scale_x_log10(labels=scales::dollar)
g2
#The power of small multiples
g3<-g2+facet_wrap(~continent)
g3
rm(g1,g2,g3)
g1<-ggplot(data=gapminder,mapping=aes(x=year,y=lifeExp))+geom_line()+theme_bw()+theme(panel.border = element_blank(), panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+ ggtitle("OECD Life Expectancy") + theme(plot.title = element_text(hjust = 0.5))+ xlab("Year")+ylab("Life Expectancy")
g1
g2<-ggplot(data=gapminder,mapping=aes(x=year,y=lifeExp))+aes(group=country) + geom_line(size=0.1)+theme_bw()+theme(panel.border = element_blank(), panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+ ggtitle("OECD Life Expectancy") + theme(plot.title = element_text(hjust = 0.5))+ xlab("Year")+ylab("Life Expectancy")
g2
g3<-g2+facet_wrap(~continent)
g3
#Layout control
g3<-g2+facet_wrap(~continent,ncol=2)
g3
g4<-g2+geom_smooth(method="lm")+facet_wrap(~continent,ncol=2)
g4
g5<-ggplot(data=gapminder,mapping=aes(x=year,y=lifeExp)) + geom_line(size=0.1,aes(group=country))+theme_bw()+theme(panel.border = element_blank(), panel.grid.major = element_blank(),panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))+ ggtitle("OECD Life Expectancy") + theme(plot.title = element_text(hjust = 0.5))+ xlab("Year")+ylab("Life Expectancy")+geom_smooth(method="lm")+facet_wrap(~continent,ncol=2)
g5

