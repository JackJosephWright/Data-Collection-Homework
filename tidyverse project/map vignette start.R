library(tidyverse)
library(httr)
library(jsonlite)

#trimmed the file from 400k observations to make loading quicker
dat<-read.csv("https://raw.githubusercontent.com/JackJosephWright/data/master/Library_Usage.csv")

#check if 
is.factor(dat$Patron.Type.Definition)

#set Patron.Type.Code as factor
dat$Patron.Type.Definition<-as.factor(dat$Patron.Type.Definition)


#split into tables by factor

df_list<-dat%>%
  group_split(Patron.Type.Definition)


factor_names<-as.list(levels(dat$Patron.Type.Definition))

#use map to name the data frames in list

test<-map()

  