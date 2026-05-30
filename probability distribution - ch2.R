# R code for simulating a random sample from the discrete uniform distribution.

# generating a vector for sample space S={1,2,3,....,20}
S = 1:20

# simulating 100 values from this sample space:
sample (S,100, replace = TRUE)
# Since there is no specific built-in function in base R for a discrete uniform distribution

# r code for simulating a random sample of 100 values from the binomial distribtuion with n=20 and p=0.3 is:
n = 20
p = 0.3
rbinom(100, n, p)
#to calculate probability mass function P(X=2) 
dbinom(2,n,p)
#cdf of binomial distribution
pbinom(2,n,p)
#quantile of binomial distribution
qbinom(0.25,n,p)
# there is a 25% cumulative probability of getting 4 or fewer successes 
# in an experiment with 20 trials and a 30% chance of success on each trial.

# r code for geometric distribution
#random sample generation
rgeom(10,0.3)
#pmf 
dgeom(10,0.3)
#cdf
pgeom(10,0.3)
#quantile
qgeom(0.4,0.3) 
#The result of this command is 1. This means that for a geometric distribution 
#with a 30% chance of success, you would have to experience at least 1 failure 
#before the first success to be in the first 30% of outcomes

#negative binomial
rnbinom(15,10,0.3)
dnbinom(15,10,0.3)
pnbinom(15,10,0.3)
qnbinom(0.25,10,0.3)
#This means there is a 25% cumulative probability of 
# observing 16 or fewer failures before achieving 10 successes with a 30% chance of success.

#hypergeometric distribution
rhyper(20,15, 10, 5)
dhyper(20,15,10,5)
phyper(20,15,10,5)
qhyper(0.75,10,5,6)
#This means that in a sample of 6, there is a cumulative probability 
# of at least 75% of drawing 5 or fewer white balls with 10 number of successes and 5 number of failures.

#poisson distribution
rpois(20,5)
dpois(3,5)
ppois(3,5)
qpois(0.25,5)
#The number of events where the cumulative probability 
# reaches or exceeds 25%, given an average rate of 5


# continuous distribution
# r code for uniform distribution
runif(100,0,3)
dunif(1.5,0,3) 
# The dunif() function returns the height of the 
# probability density function (PDF) at a given point x. 
# In a continuous distribution, the probability of any single point is zero,
# so this value is not a probability itself but a measure 
# of its relative likelihoodand abd is useful for graphing.

punif(1.5,0,3)
qunif(0.25,0,3)
# for a continuous uniform distribution over the interval [0, 3],
# there is a 25% probability that a random value will be less than or equal to 0.75

# gamma distribution
rgamma(100,2,0.25)
dgamma(4,2,0.25)
pgamma(4,2,0.25)
qgamma(p=0.25,shape=2,rate=0.25)
#For a gamma distribution with a shape parameter of 2 and a rate parameter of 0.25,
# there is a 25% probability that a random value drawn from this distribution
# will be less than or equal to 3.845115

# exponential distribution
rexp(20,3)
dexp(2,3)
pexp(2,3)
qexp(0.25,3)
# an exponential distribution with a rate parameter of 3 (and a mean of 1/3), 
# there is a 25% probability that a random value will be less than or equal to 0.09589.

# chi-square distribution
rchisq(100,2)
dchisq(2,2)
pchisq(2,2)
qchisq(0.25,2)
#a chi-squared distribution with 2 degrees of freedom, there is a 25% probability 
# that a random value drawn from this distribution will be less than or equal to 0.575.

#beta distribution
rbeta(100,2,3)
dbeta(0.2,2,3)
pbeta(0.2,2,3)
qbeta(0.25,2,3)
#There is a 25% probability that a random variable following a Beta(2, 3)
#distribution will have a value less than or equal to the 0.24

#normal distribution
rnorm(100,2,3)
dnorm(2,2,3)
pnorm(2,2,3)
qnorm(0.5,2,3)
#50% of a random variable following a Normal(mean=2, sd=3) 
#distribution will have a value less than or equal to the 2 which is mean. 

#lognormal distribution
rlnorm(100,2,3)
dlnorm(2,2,3)
plnorm(2,2,3)
qlnorm(.5,2,3)
#There is a 50% probability that a random variable following
#this log-normal distribution will have a value less than or
#equal to the result of this function

#t distribution
rt(100,10)
dt(4,10)
pt(4,10)
qt(0.5,10)
#There is a 50% probability that a random variable
#following a t-distribution with 10 degrees of freedom 
#will have a value less than or equal to 0


#f distribution
rf(100,5,6)
df(4,5,6)
pf(4,5,6)
qf(0.5,5,6)
#There is a 50% probability that a random variable following
#an F-distribution with 5 numerator degrees of freedom and 
# 6 denominator degrees of freedom will have a value less 
#than or equal to 0.97

# monte carlo simulation


