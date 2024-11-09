#Visualization #1: Create stratified box plot of text messages by Group
setwd("/cloud/project")

install.packages("knitr")

library(knitr)

install.packages("pastecs")
#this is to install packages

library(pastecs)


install.packages("ggplot2")
#this is to install packages

library(ggplot2)
#Referencing the data file
textmessages <- read.csv("TextMessages.csv", header = TRUE)
#The data file is now called textmessages

names(textmessages)
#To view and print the variable names on the console window

max(textmessages$Six_months)
#This is to gauge what our box plot max will be based on the text messages for
#The totality of 6 months

min(textmessages$Six_months)
#This is to gauge what our box plot min will be based on the text messages for
#The totality of 6 months

#We want to obtain a plot with stratified results of text messages by group
is.factor(textmessages$Group)
#Because group is not a factor, we convert it to overwrite the non-factored
#Group variable that existed in the data 

textmessages$Group <- as.factor(textmessages$Group)
#Converting Group to a factor  

is.factor(textmessages$Group)
#Allows us to confirm Group is now a factor

boxplot_textmessagesbyGroup <- ggplot(textmessages, aes(Group, Six_months))


boxplot_textmessagesbyGroup +geom_boxplot() + labs(x= "Group", y= "Text Messages by Group") + scale_y_continuous(limits= c(0,80), breaks = seq(from=0, to =80, by=5))
#Both Box plots for Group 1 and Group 2 show a skewed samples to the left.
#For Group 1, we have the most outliers in comparison to Group 2,
#For a total of 5 outliers for group 1 in comparison to 2 in Group 2. 

by(textmessages$Six_months,textmessages$Group,median)
#This will output the median of Text Messages by Group
#For group 1, the median is 58 versus 62 for group 2

#This will output the quantiles of The Text Messages by Group using the by() 
#command from the pastecs packages
by(textmessages$Six_months, textmessages$Group, quantile)
#This output confirms that Group 2 surpasses Group 1 in each percentile. 
#For the 75th percentile, Group 2 is 64 vs 61, and for the 50th percentile, 
# Group 2 is 62 vs 58. 

