
#simulated mean and variance of poisson distribution
set.seed(23)
xbar<- rep(0,1000)
for (i in 1:1000)
{x<-rpois(40,5)
xbar[i]<-mean(x)
print(paste("xbar[",i,"] = ",xbar[i]))
if (i %% 100 == 0) {
  print(paste("Completed", i, "of 1000 iterations..."))
}
}  
print("The for loop is complete.")
print(paste("the mean is:",mean(xbar)))
print(paste("the variance is:",round(var(xbar),digits=5)))

#comparing the distribution of the sample means with the 
#normal approximation by plotting a histogram of the sample means
hist(xbar, prob=TRUE, ylim = c(0,1.2))
curve(dnorm(x, mean=5, sd=sqrt(0.125)), add= TRUE, lwd=2, col="red")
#using default setting type 7, for cs1 we prefer type 5 or 6
#r uses (n+3)/4 and (3n+1)/4 for the lower and upper quartiles position
quantile(xbar)
# quantile using type 6
quantile(xbar, type =6)
# For a large sample size like 1000, the results for the different 
#types will be very similar, but for small datasets, the choice of type can make a noticeable difference
qnorm(0.25,mean=5, sd=sqrt(0.125))
qnorm(0.5,mean=5, sd=sqrt(0.125))
qnorm(0.75,mean=5, sd=sqrt(0.125))
# Create the Normal Q-Q plot
qqnorm(xbar)
# Add the reference line
qqline(xbar, col = "grey", lwd = 2,lty = 2)
skewness(xbar)


# Your xbar data (should be close to a straight line)
qqnorm(xbar, main = "Q-Q Plot for xbar (Approx. Normal)")
qqline(xbar, col = "red", lty = 2, lwd = 2)

# Generate heavy-tailed data (Student's t with 3 degrees of freedom)
heavy_tail_data <- rt(1000, df = 3)

# Generate light-tailed data (uniform distribution)
light_tail_data <- runif(1000)

# Heavy-tailed data (t-distribution)
qqnorm(heavy_tail_data, main = "Q-Q Plot for Heavy-Tailed Data - concave up and concave down")
qqline(heavy_tail_data, col = "red", lty = 2, lwd = 2)

# Light-tailed data (uniform distribution)
qqnorm(light_tail_data, main = "Q-Q Plot for Light-Tailed Data - concave down and concave up")
qqline(light_tail_data, col = "red", lty = 2, lwd = 2)

#graph of z distribution and t distribution

# 1. Create a sequence of x values (e.g., from -4 to 4)
x_values <- seq(-4, 4, length = 200)

# 2. Calculate the density for the Z-distribution (mean=0, sd=1)
# dnorm is used for the standard normal density
z_density <- dnorm(x_values)

# 3. Calculate the density for the t-distribution with df=10
df1 <- 10
t_density_10 <- dt(x_values, df1 )

# 4. Calculate the density for the t-distribution with df=2
df2 <- 2
t_density_2 <- dt(x_values, df2 )

# 5. Plot the Z-distribution first
plot(x_values, z_density,
     type = "l",          # Draw a line
     col = "red",   # Color the line red
     lwd = 2,             # Make the line slightly thicker
     xlab = "x",      # Label the x-axis
     ylab = "PDF",    # Label the y-axis
     main = bquote("Z-Distribution vs. " * t[10] * " Distribution"), # Add a title
     ylim = c(0, 0.4)     # Set the y-axis limits to fit both curves
)

# 6. Add the t_10 distribution line to the existing plot
lines(x_values, t_density_10,
      col = "blue",      # Color the line blue
      lwd = 2,           # Make the line slightly thicker
      lty = 2         # Use a dashed line type for contrast
)

# 7. Add the t_2 distribution line to the existing plot
lines(x_values, t_density_2,
      col = "orange",      # Color the line yellow
      lwd = 2,           # Make the line slightly thicker
      lty = 2         # Use a dashed line type for contrast
)


# 8. Add a legend to the plot
legend("topright",
       legend = c(
         bquote(italic("Z-distribution (SND)")),
         bquote(italic(t[.(df1)])), bquote(italic(t[.(df2)]))
       ),
       col = c("red", "blue", "orange"),
       lwd = 2,
       lty = c(1, 2),
       cex = 0.7          # Adjust legend size
)



#graph of f distribution for F_9,4 > 6, See page 261
# Degrees of freedom
df_num <- 9
df_den <- 4
critical_value_5pct <- qf(0.95, df1 = df_num, df2 = df_den) # 5.9988
test_statistic <- 6

# 1. Create a sequence of x values for the F-distribution curve
# Start from 0 (F-stat is always positive) and go a bit beyond 6
x <- seq(0, 10, length = 500)
# Calculate the density (height of the curve) for each x value
y <- df(x, df1 = df_num, df2 = df_den)

# 2. Plot the F-distribution curve
plot(x, y, type = "l", lwd = 2, col = "black",
     main = bquote("F-distribution with df (" * .(df_num) * "," * .(df_den) * ")"),
     xlab = "F-Statistic Value",
     ylab = "Density",
     ylim = c(0, 0.7))

# 3. Highlight the 5% Critical Value (5.999) - Shaded area is 0.05
# Define the coordinates for the shaded polygon area > 5.999
x_5pct_area <- seq(critical_value_5pct, 10, length = 100)
y_5pct_area <- df(x_5pct_area, df1 = df_num, df2 = df_den)
polygon(c(critical_value_5pct, x_5pct_area, 10), c(0, y_5pct_area, 0), col = "grey80", border = NA)

# 4. Highlight the Test Statistic Value (6.0) - Shaded area is 0.0264
# Define the coordinates for the smaller shaded area > 6
x_6_area <- seq(test_statistic, 10, length = 100)
y_6_area <- df(x_6_area, df1 = df_num, df2 = df_den)
polygon(c(test_statistic, x_6_area, 10), c(0, y_6_area, 0), col = "red", border = NA)


# 5. Add vertical lines for context
abline(v = critical_value_5pct, col = "grey50", lty = 2, lwd=2) # Dashed line for 5% point
abline(v = test_statistic, col = "red", lty = 1, lwd=2)       # Solid line for F=6


# 6. Add a legend
legend("topright",
       legend = c(
         "F-distribution PDF",
         bquote("Area >" * .(round(critical_value_5pct, 3)) * " (5% cutoff)"),
         bquote("Area > 6 (p-value " * .(round(pf(6, df1=9, df2=4, lower.tail=FALSE), 4)*100) * "%)")
       ),
       col = c("black", "grey80", "red"),
       lwd = c(2, NA, NA),
       fill = c(NA, "grey80", "red"),
       border = c(NA, "grey80", "red"),
       cex = 0.6
)


