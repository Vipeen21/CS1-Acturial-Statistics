#Bootstrap Method to estimate the properties of an estimator we either the 
#assumptions or asymptotic results may not hold eg- when samples are small

# Non-parametric (full) bootstrap
sample.data <- c(0.61,6.47,2.56,5.44,2.72,0.87,2.77, 6.0, 0.14, 0.75)
sample(sample.data, replace = TRUE)

# obtain 1000 estimates of the and storing in the vector "estimate"
set.seed(47)
estimate <- rep(0,1000)
for (i in 1:1000)
{x<- sample(sample.data, replace = TRUE);
estimate[i]<- 1/mean(x);
print(paste("estimate[",i,"] = ", round(estimate[i],5)))}

#alternative method
set.seed(47)
estimate<- replicate (1000,1/mean(sample(sample.data,replace = TRUE)))
print(estimate)

# histogram of estimates
hist(estimate, 
     xlab = "Estimate",        # Label for the x-axis
     ylab = "Frequency",       # Label for the y-axis (default behavior, but good practice to specify)
     main = "Histogram of Estimates for Lambda", # A descriptive title for the plot
     col = "lightblue",        # Optional: Adds color to the bars
     border = "black"          # Optional: Adds a border to the bars
)

# mean, standard error of the estimatoe lambda cap and a 95% confidence interval for the unknown parameter
mean(estimate)
sd(estimate)
quantile(estimate,c(0.025,0.975))

# parametric bootstrap - using the exponential distribution to obtain new samples
set.seed(47)
param.estimate<-rep(0,1000)
for (i in 1:1000)
{x<-rexp(10, rate= 1/mean(sample.data));
param.estimate[i]<- 1/mean(x)
print(paste("parametric estimate[",i,"] = ", round(param.estimate[i],5)))}

# histogram of parametric estimates
hist(param.estimate, 
     xlab = "parametric Estimate",        # Label for the x-axis
     ylab = "Frequency",       # Label for the y-axis (default behavior, but good practice to specify)
     main = "Histogram of parametric Estimates for Lambda", # A descriptive title for the plot
     col = "lightblue",        # Optional: Adds color to the bars
     border = "black"          # Optional: Adds a border to the bars
)
