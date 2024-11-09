#Part three
setwd("/cloud/project")

# Install packages if they are not already installed
install.packages("dplyr")
install.packages("reshape2")

# Load libraries
library(dplyr)
library(reshape2)

# Load the dataset
data <- read.csv("path/to/TextMessages.csv")

# Reshape data to long format for easier grouping by Group and Time
data_melted <- melt(data, id.vars = c("Group", "Participant"), 
                    variable.name = "Time", value.name = "Messages")

# Calculate summary statistics
summary_stats <- data_melted %>%
  group_by(Group, Time) %>%
  summarise(
    mean_messages = mean(Messages, na.rm = TRUE),
    median_messages = median(Messages, na.rm = TRUE),
    min_messages = min(Messages, na.rm = TRUE),
    max_messages = max(Messages, na.rm = TRUE),
    sd_messages = sd(Messages, na.rm = TRUE)
  )

# A tibble: 4 x 7
#Group Time        mean_messages median_messages min_messages max_messages sd_messages
#<dbl> <chr>               <dbl>           <dbl>        <dbl>        <dbl>       <dbl>
#  1      Baseline           64.84             64.0           47           85       10.68
#1    Six_months           52.96             58.0            9           78       16.33
#2      Baseline           65.60             65.0           46           89       10.84
#2    Six_months           61.84             62.0           46           79        9.41


#Based on the output:
  
 # Mean Message Counts:
  
#Group 1: The mean number of messages declined from 64.84 at Baseline to 52.96 at Six_months, indicating a reduction in messaging over time.
#Group 2: A smaller decrease in mean messages from 65.60 at Baseline to 61.84 at Six_months, suggesting more stable messaging behavior in Group 2.
#Median Message Counts:
  
#Median values confirm the mean trends. Group 1 shows a higher median than mean at Six_months, indicating potential outliers with lower messaging.
#Range and Variability:
  
#Group 1 has a greater variability at Six_months (SD = 16.33), with a wide range from 9 to 78 messages, suggesting diverse messaging behaviors.
#Group 2 has a more consistent range and lower variability, particularly at Six_months (SD = 9.41), implying more uniform messaging patterns.
#These statistics reveal group-specific patterns and provide insights into messaging behavior changes over time.

