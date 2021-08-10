# Exoplanet Analysis
# Jason M. Grayson
# Started 07/06/2021

rm(list=ls())
library(visdat)
library(tidyverse)

Exoplanet_Data <- read_csv("Exoplanet_Data.csv")
Exoplanet_Codebook <- read_csv("Exoplanet_Codebook.csv")
df<-Exoplanet_Data[,c(1,11,34,50,83,160,176,218)]
vis_dat(df)
df2<-mutate(df,meters_distance=(sy_dist*3.086*10^16))
velocity=0.999999
two_way_time=10
one_way_time=20

rel_calcs<-function(velocity,two_way_time,one_way_time){
    time_dil_factor=(1/sqrt(1-(velocity^2)))
    length_contraction_factor<-sqrt(1-(velocity^2))
    light_year=9.461*10^15
    one_way_max=(one_way_time*light_year)/length_contraction_factor
    two_way_max=(two_way_time*light_year)/length_contraction_factor
    earth_time_elapsed=(one_way_time*time_dil_factor)
    output<-list(one_way_max,two_way_max,earth_time_elapsed)
    return(output)
}
rel_calc_1<-rel_calcs(velocity,two_way_time,one_way_time)
dist1<-rel_calc_1[[1]]
dist2<-rel_calc_1[[2]]
dist_limit_one<-rep(dist1,29477)
dist_limit_two<-rep(dist2,29477)
df3<-cbind(df2,dist_limit_one,dist_limit_two)
df4<-mutate(df3,dist_leftover=(dist_limit_one-meters_distance))
df5<-filter(df4,dist_leftover>0)
# filter further to get planet type you are most interested in!