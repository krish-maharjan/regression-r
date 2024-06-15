# Set seed for reproducibility
set.seed(123)

# Number of data points
n <- 100

# Generate predictor variable x (let's say it's from a normal distribution)
x <- rnorm(n)

# Generate response variable y with some noise
# Let's say y = 2*x + 1 + noise
y <- 2*x + 1 + rnorm(n)

# Combine x and y into a data frame
dummy_data <- data.frame(x = x, y = y)

# Check the first few rows of the data
head(dummy_data)

# Fit linear regression model
lm_model <- lm(y ~ x, data = dummy_data)

# Print the summary of the model
summary(lm_model)

# Plot the data points and the regression line using base graphics
plot(x, y, main = "Scatterplot with Linear Regression Line")
abline(lm_model, col = "red")

# Installing and loading necessary packages for ggplot2 and ggpmisc
# install.packages("ggplot2")
# install.packages("ggpmisc")
library(ggplot2)
library(ggpmisc)

# Scatter plot with regression line and equation using ggplot2
p <- ggplot(dummy_data, aes(x = x, y = y)) +
  geom_point() +  # Scatter plot of x vs y
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Adding linear regression line
  stat_poly_eq(aes(label = paste("y == ", after_stat(eq.label), "~~", after_stat(..rr.label..), sep = "")), 
               formula = y ~ x, 
               parse = TRUE, 
               size = 5, 
               label.x = "right", 
               label.y = 0.15) +  # Adding equation of the line
  labs(title = "Scatter plot with Linear Regression Line and Equation") +
  theme_minimal()

# Print the plot
print(p)