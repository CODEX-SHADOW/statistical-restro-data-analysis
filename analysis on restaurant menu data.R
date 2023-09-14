# Restaurant Menu Analysis R Script
# Author: ABHISHEK N HIREMATH
# Date:15/09/2023 
# Description: This script performs statistical analysis on restaurant menu data.

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Load the data (replace with your data file path)
data <- read.csv("Group 1_fastfood.csv")

# Explore the data
# View the structure of the data
str(data)

# Summary statistics for numerical columns
summary_stats <- summary(data[, 3:14])
print("Summary Statistics:")
print(summary_stats)

# T-test example: Compare the mean calories of two menu item categories (e.g., salads vs. non-salads)
salads_calories <- data %>%
  filter(salad == "Salad") %>%
  select(calories)

non_salads_calories <- data %>%
  filter(salad != "Salad") %>%
  select(calories)

t_test_result <- t.test(salads_calories, non_salads_calories)
print("T-Test Result:")
print(t_test_result)

# Create a directory for saving plots and results (replace with your preferred directory)
output_dir <- "analysis_output"
dir.create(output_dir, showWarnings = FALSE)

# Create histograms for selected columns (e.g., calories, total fat)
histogram_calories <- ggplot(data, aes(x = calories)) +
  geom_histogram(binwidth = 50, fill = "blue", color = "black") +
  labs(title = "Distribution of Calories", x = "Calories", y = "Frequency")

# Save the histogram as an image (PNG format)
png(file.path(output_dir, "histogram_calories.png"), width = 800, height = 600)
print(histogram_calories)
dev.off()

# Add more plots and save them as needed
