#ch-15 page 697
#median of gamma (36,12)
qgamma(0.5,36,12)
# 90% equal-tailed credible intervals
qgamma(0.05,15,5.3)
qgamma(0.95,15,5.3)

# 95% equal-tailed credible intervals page 705 and the graph of pdf of gamma (15,5.3)
qgamma(0.025,15,5.3)
qgamma(0.975,15,5.3)

# Define the parameters for the Gamma distribution
alpha <- 15
lambda <- 5.3

# 1. Find the boundaries of the 95% credible interval
lower_bound <- qgamma(0.025, shape = alpha, rate = lambda)
upper_bound <- qgamma(0.975, shape = alpha, rate = lambda)

# Print the interval bounds
print(paste("The 95% credible interval is:", round(lower_bound, 3), "to", round(upper_bound, 3)))

# 2. Generate the plot
# Create a sequence of x-values for the density curve
x_range <- seq(qgamma(0.001, shape = alpha, rate = lambda), 
               qgamma(0.999, shape = alpha, rate = lambda), 
               length.out = 500)
y_values <- dgamma(x_range, shape = alpha, rate = lambda)

# Plot the full density curve
plot(x_range, y_values, type = "l",
     main = "PDF of Gamma(15, 5.3) with 95% Credible Interval",
     xlab = "x",
     ylab = "Density",
     lwd = 2, col = "blue")

# 3. Draw the shaded region
# Find the x and y values for the shaded area
x_shaded <- c(lower_bound, x_range[x_range > lower_bound & x_range < upper_bound], upper_bound)
y_shaded <- c(0, dgamma(x_shaded[-c(1, length(x_shaded))], shape = alpha, rate = lambda), 0)

# Use the polygon() function to add the shaded region
polygon(x_shaded, y_shaded, col = "grey", border = NA)

# Add the lines again to ensure they are on top of the shaded area
lines(x_range, y_values, lwd = 2, col = "blue")

# Add vertical lines at the interval boundaries
abline(v = c(lower_bound, upper_bound), lty = 2, col = "red")

# Add a legend
legend("topright", legend = c("PDF Curve", "95% Credible Interval"),
       col = c("blue", "grey"), pch = c(NA, 15), lty = c(1, NA), lwd = c(2, NA))
set.seed(3)
x<- rgamma(100000,15,5.3)
hdi(x,ci=0.95)
find.package("bayestestR")
