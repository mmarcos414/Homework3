#Part 3


setwd("/cloud/project")

install.packages("gridExtra")

library(dplyr)
library(gridExtra)

# Load your data (adjust the path as necessary)
text_messages <- read.csv("path/to/TextMessages.csv")

summary_stats <- text_messages %>%
  group_by(Group) %>%
  summarize(
    baseline_mean = mean(Baseline, na.rm = TRUE),
    baseline_median = median(Baseline, na.rm = TRUE),
    baseline_min = min(Baseline, na.rm = TRUE),
    baseline_max = max(Baseline, na.rm = TRUE),
    six_months_mean = mean(Six_months, na.rm = TRUE),
    six_months_median = median(Six_months, na.rm = TRUE),
    six_months_min = min(Six_months, na.rm = TRUE),
    six_months_max = max(Six_months, na.rm = TRUE)
  )

# Set up the PDF file
pdf("TextMessages_Summary_Statistics.pdf", width = 8, height = 6)

# Convert summary statistics to a table format and print to PDF
grid.table(summary_stats)

# Close the PDF device
dev.off()

