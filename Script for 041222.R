rm(list=ls())
getwd()
df <- read.csv("SSS CSV.csv")
library(ggplot2)
library(plotrix)
df$Day <- as.factor(df$Day)
p <- ggplot(data = df, aes(x=Day, y=Value, fill=Strain)) + geom_bar(stat = "identity", position = position_dodge(1.0))
p
#q <- ggplot(data=df, aes(x=Day, y=Value, fill= Strain)) +
  #geom_bar(colour= "black", width=0.5, position=position_dodge(0.5))+
  #geom_errorbar(aes(x= Day, ymin=mean-se, ymax=Value+se))+
  #position= position_dodge((0.5), width=0.25)+
  #scale_x_discrete(limits=c("1","2","4","6","8","10","12","14"))+
  #scale_y_continuous(breaks=seq(0,100, by =10),limits = c(0,100), expand = c(0,0))+
  #theme_minimal()+
  #theme(axis.line = element_line(color = 'black'),
  #      axis.ticks = element_line(color = "black"),
  #      panel.border = element_blank())
#q
r <- ggplot(data=df, aes(x=Day, y=Value, fill= Strain)) +
  geom_col(colour= "black", width=0.5, position=position_dodge(0.5)) +
  scale_x_discrete(limits=c("1","2","4","6","8","10","12","14"))
r
t<-ggplot(df,aes(x=Day, y=Value, fill=Strain)) + 
  stat_summary(geom = "bar", fun = mean, position = "dodge") +
  stat_summary(geom = "errorbar", fun.data = mean_se, position = "dodge")
plot(t)
