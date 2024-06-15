# Example data
Duration <- c(1, 2, 3, 4, 5)
HeartRate <- c(100, 95, 90, 85, 80)

# Perform linear regression
regressionline.lm <- lm(HeartRate ~ Duration)

# Plot the data and regression line
plot(Duration, HeartRate, main = "Heart Rate vs. Duration", xlab = "Duration", ylab = "Heart Rate")
abline(regressionline.lm, col = "green")

# Add text to the plot
text(3, 95, "HeartRate = -5.468023*Duration + 96.901980", col = "green")
