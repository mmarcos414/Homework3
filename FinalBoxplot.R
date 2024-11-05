setwd("/cloud/project")

install.packages("pastecs")

library(pastecs)


install.packages("ggplot2")

library(ggplot2)

textmessages <- read.csv("TextMessages.csv", header = TRUE)


names(textmessages)


max(textmessages$Six_months)


min(textmessages$Six_months)

is.factor(textmessages$Group)

textmessages$Group <- as.factor(textmessages$Group)

is.factor(textmessages$Group)

boxplot_textmessagesbyGroup <- ggplot(textmessages, aes(Group, Six_months))

boxplot_textmessagesbyGroup +geom_boxplot() + labs(x= "Group", y= "Text Messages by Group") + scale_y_continuous(limits= c(0,80), breaks = seq(from=0, to =80, by=5))
