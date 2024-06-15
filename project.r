# Load required libraries
library(ggplot2)

# Create dummy data
x <- 1:10
y <- c(2, 4, 6, 8, 10, 12, 14, 16, 18, 20)

# Create a data frame
df <- data.frame(x, y)

# Create scatter plot with regression line
plot <- ggplot(df, aes(x, y)) +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE) +
    labs(title = "Scatter Plot with Regression Line", x = "X", y = "Y")

# Add equation text on the chart
equation <- paste("y =", round(coef(lm(y ~ x, data = df))[2], 2), "* x +", round(coef(lm(y ~ x, data = df))[1], 2))
plot <- plot + annotate("text", x = max(df$x), y = max(df$y), label = equation, hjust = 1, vjust = 1)

# Display the plot
print(plot)