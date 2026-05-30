# Example: Calculate the power of a one-sample t-test
# Parameters:
#   Sample size (n) = 30
#   True mean difference (delta) = 0.5 (e.g., hypothesized mean is 0, true mean is 0.5)
#   Standard deviation (sd) = 1 (can be estimated from previous studies or a pilot)
#   Significance level (sig.level) = 0.05
#   Type of test = "one.sample"
#   Alternative hypothesis = "two.sided" (default, or "one.sided")

power.t.test(n = 30, delta = 0.5, sd = 1, sig.level = 0.05, type = "one.sample", alternative = "two.sided")

