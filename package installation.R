#R studio packages for actuary
# Install all general and actuarial-specific packages
#install.packages(c("tidyverse", "data.table", "survival", "caret", "knitr", 
                   "actuar", "chainLadder", "MortalityLaws", "finCal", 
                   "actuaryr", "ActuarialM"))

                   
# Load core tidyverse packages
#library(tidyverse)
                   
# Load other general statistical packages
#library(data.table)
#library(survival)
#library(caret)
#library(knitr)
                   
# Load actuarial-specific packages
#library(actuar)
#library(chainLadder)
#library(MortalityLaws)
#library(finCal)
#library(actuaryr)
#library(ActuarialM)
                   
                   
#General Statistical & Data Handling Packages
#These packages are used across data science and are fundamental for most actuarial work:
#tidyverse: This is a collection of packages with a shared design philosophy, essential for efficient data analysis. Key components include:
  #dplyr: For data manipulation (filtering, summarizing, rearranging, joining data sets).
  #ggplot2: For creating high-quality data visualizations (plots, graphs).
  #tidyr: For tidying and reshaping data into a consistent format.
  #readr: For fast and efficient reading of data files (CSV, etc.).
  #lubridate: For easily working with dates and times, which is crucial for time-sensitive actuarial data.
  #data.table: An alternative to dplyr that provides high-performance data manipulation, especially useful for very large datasets.
  #survival: A recommended package in R for survival analysis, which is fundamental in life insurance and pensions.
  #caret: For Classification And Regression Training, it provides tools for building and evaluating predictive models in R.
  #knitr and R Markdown: For creating dynamic and reproducible reports that combine code, results, and narrative text. 
  
                   
#Actuarial-Specific Packages
#These packages provide specialized functions tailored to actuarial science:
  #actuar: The most prominent R package for actuarial science, offering functions for:
  #Loss distribution modeling (including 18 additional probability distributions).
  #Risk theory (e.g., ruin theory calculations).
  #Credibility theory.
  #Handling grouped data and calculating moments with coverage modifications (deductibles, limits).
  #chainLadder: Provides statistical methods and models specifically for claims reserving in general (non-life) insurance.
  #MortalityLaws: Offers functions for parametric mortality models and working with life tables.
  #finCal: For time value of money calculations and computational finance.
  #actuaryr and ActuarialM: Other packages available on CRAN that help in developing actuarial models and computing actuarial measures
                   
                   
                   
install.packages(c("fpp", "markovchain", "forecast", "dplyr", "readxl", "psych", "corrplot", "flexsurv", "survival"))
install.packages("fpp2")
install.packages("fpp3")  

# Create a character vector containing all the package names
packages <- c(
  "actuar", "copula", "ggplot2", "readr",
  "base", "corrplot", "graphics", "readxl",
  "broom", "data.table", "grDevices", "rpart",
  "caret", "datasets", "lattice", "rpart.plot",
  "cluster", "diagram", "lubridate", "rsample",
  "fable", "dplyr", "markov chain", "sde",
  "fitdistrplus", "expm", "markovchain", "stats",
  "flexsurv", "fpp", "MASS", "stringr",
  "forecast", "fracdiff", "methods", "survival",
  "moments", "plyr", "psych", "survminer",
  "metrics", "pracma", "pROC", "tidyr",
  "mvtnorm", "purrr", "randomForest", "tseries",
  "utils", "plotly", "glmnet"
)

# Install all packages in the vector
install.packages(packages, dependencies = TRUE)


if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(c("graph", "Rgraphviz"))


# 1. Ensure 'remotes' is installed
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")

# 2. Install the specified version using a stable CRAN mirror
remotes::install_version("Metrics", version = "0.1.4", repos = "https://cran.rstudio.com/")
