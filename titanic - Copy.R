# Auth: Veer Rajguru
# Date: Oct 21, 2017
# Desc: Titanic Kaggle Dataset
# 
# References : 
# 1. https://github.com/EasyD/IntroToDataScience


#load raw data
setwd("C:/Users/user/Downloads/Titanic")
train<-read.csv("train.csv",header = TRUE)
test<-read.csv("test.csv",header = TRUE)
View(train)
View(test)

# add a 'survived' variable to the test set to allow for combining data sets
test.survived<-data.frame(survived=rep("None",nrow(test)),test[,])
View(test.survived)


#Combined data sets
test.survived<-data.frame(Survived=rep("None",nrow(test)),test[,])
View(test.survived)
data.combined<-rbind(train, test.survived)


# A bit about R data types (e.g: factors)
str(data.combined)


data.combined$Survived<-as.factor(data.combined$Survived)
data.combined$Pclass<-as.factor(data.combined$Pclass)


# take a look at survival rates
table(data.combined$Survived)


#distribution across classes
table(data.combined$Pclass)


#lool up ggplot2 package to use for visualizations
library(ggplot2)


#Hypothesis- Rich folks survived at a higher rate
train$Pclass<-as.factor(train$Pclass)
  ggplot(train,aes(x=Pclass,fill=factor(Survived)))+
    stat_count(width=0.5)+
    xlab("Pclass")+
    ylab("total Count")+
    labs(fill="Survived")
  
# Examine the first few names in the training data set
  head(as.character(train$Name))
  
  
#How many unique names are there across both train & test ?
  length(unique(as.character(data.combined$Name)))
  

#Two duplicate names, take a closer look 
#First,get the duplicate names and store them as a vector
dup.names<-as.character(data.combined[which(duplicated(as.character(data.combined$Name))),"Name"])
  