library(ggplot2)
library(gridExtra)

# Read the data from the CSV file
data <- read.csv("query1.csv")

# Compute the correlation matrix
cor_matrix <- cor(data)

# Assuming you have a dataframe called 'data' containing the relevant variables
data <- query1

# Bar chart for Dalc
plot_dalc <- ggplot(data, aes(x = Dalc)) +
  geom_bar() +
  labs(title = "Distribution of Dalc")

# Bar chart for Walc
plot_walc <- ggplot(data, aes(x = Walc)) +
  geom_bar() +
  labs(title = "Distribution of Walc")

# Bar chart for studytime
plot_studytime <- ggplot(data, aes(x = studytime)) +
  geom_bar() +
  labs(title = "Distribution of studytime")

# Bar chart for failures
plot_failures <- ggplot(data, aes(x = failures)) +
  geom_bar() +
  labs(title = "Distribution of failures")

# Bar chart for count_failures
plot_count <- ggplot(data, aes(x = count)) +
  geom_bar() +
  labs(title = "Distribution of count_failures")

# Combine the bar charts into one picture
combined_plot <- grid.arrange(plot_dalc, plot_walc, plot_studytime, plot_failures, plot_count, nrow = 2, ncol = 3)

# Display the combined plot
print(combined_plot)

# Calculate correlations
cor_matrix <- cor(data)

# Print correlations for each pair
for (i in 1:(ncol(cor_matrix) - 1)) {
  for (j in (i + 1):ncol(cor_matrix)) {
    cat("Correlation between", names(cor_matrix)[i], "and", names(cor_matrix)[j], ":",
        round(cor_matrix[i, j], 2), "\n")
  }
}
# Calculate correlations
cor_matrix <- cor(data)

# Create the correlation matrix plot
corrplot(cor_matrix, method = "color", type = "upper", order = "hclust", 
         diag = FALSE)
