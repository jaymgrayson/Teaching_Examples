# Flow QC check
# 
# Started 

library(flowCore)

rm(list=ls())
# set working directory of files

flow_df<-read.FCS(file="Data_001.fcs")
flow_df<-exprs(flow_df)
flow_df<-as.data.frame(flow_df)

# Create function that will do quality control:
# Warning if 1% of data have Flourescent channel above 200,000
# Error if 5% data exceed above threshold
# Print out when complete for all 3 files