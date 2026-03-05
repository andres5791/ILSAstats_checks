rm(list=ls())
library(dplyr)
outputdir <- "outputSPSS"


# Get all .csv files
files <- list.files(outputdir, 
                    pattern = "*.csv", full.names = TRUE)

decimal.point <- "comma" # "dot" if dot is used for decimal point

for(i in 1:length(files)){
 
  message(i)
   
  if(decimal.point == "comma") tab <- read.csv2(files[i])
  if(decimal.point == "dot") tab <- read.csv(files[i])
  
  if("infile" %in% names(tab)) tab <- tab %>% select(-infile)
  
  if(decimal.point == "comma") write.csv2(tab , files[i])
  if(decimal.point == "dot") write.csv(tab , files[i])
  
}