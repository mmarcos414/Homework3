setwd("/cloud/project")

#Install and load statistic descriptive packages to be used later. Also our
#newest package that reads .xlsx files. Followed by ggplot to make our graphs.
install.packages("pastecs")
install.packages("magick")
install.packages("pdftools")
install.packages("readxl")
install.packages("ggplot2")
install.packages("Hmisc")
install.packages("reshape")
library(pastecs)
library(magick)
library(pdftools)
library(readxl)
library(ggplot2)
library(Hmisc)
library(reshape)

#Removes scientific notation from outputs.
options(scipen=999)

#Read the data and store under named object
TextMess <- read.csv("TextMessages.csv", header = TRUE)

#Reshape the data in order to make Time a category
TextMessLong <- melt(TextMess[-1],id.vars="Participant",variable.name=
                       "Time", value.name = "Texts")

#I could not figure out why the line of code above was not renaming my columns,
#so the following line manually renames each column
names(TextMessLong) <- c("Participant","Time","Texts")

#Create the first layer of the bar plot and assign data to the axis.
TimeBar <- ggplot(TextMessLong, aes(Time, Texts))

#This plots the averages of both categories of time onto the bar plot. It also
#sets limits for the graph and assigns the measurement of increment each line
#jumps to make it easier to understand the values of each bar.
TimeBar+stat_summary(fun.y=mean, geom="bar", fill="White", colour ="Black") + 
  labs(x="Time", y="Avg Number of Text Messages") +
  scale_y_continuous(limits=c(0,90), breaks= seq(from=0, to=90, by=5))
#The graph allows us to see that the average number of text messages decreased 
#by about 10 from ~65 at the baseline, to ~55 at six months.


