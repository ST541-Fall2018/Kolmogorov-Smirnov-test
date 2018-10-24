---
title: "haddadis-project-KStest"

output:
  html_document:
    keep_md: true
---



## Doing some silumations

In this section, I am taking samples of size 10, 50, 100, and 1000 from distributions with the same means and different distributions to address the first question in my project proposal. In this regard, a function `sample_anyDistribution.R` is created and saved in the R directory. Inputs of the functions are sample size (n) and a distribution (sample_fun). The function takes the inputs arguments and the output is a sample of size n from the specified distribution. The distributions I have chosen for this projects are:

  1. $Normal(\mu = 1/2, \sigma^2 = 1)$
  2. $exponential(\lambda = 2)$
  3. $poisson(\lambda = 1/2)$
  4. $beta(\alpha = 2, \beta = 2)$
  5. $gamma(\alpha = 2, \beta = 1/4)$

All these distributions have the same population means (0.5). I should repeat the process several times for different distributions and different sample sizes, and perform the KS test to see if the rejection rate gets close to the significance level as the sample size increases.


```r
# Here is the data frame I created for different distributions and sample sizes

samples_distributions <- data_frame(
  sample_size = c(10, 50, 100, 1000),
  normal = map(sample_size, sample_anyDistribution, sample_fun = rnorm, mean = 1/2, sd = 1),
  exponential = map(sample_size, sample_anyDistribution, sample_fun = rexp, rate = 2),
  poisson = map(sample_size, sample_anyDistribution, sample_fun = rpois, lambda = 1/2),
  beta = map(sample_size, sample_anyDistribution, sample_fun = rbeta, shape1 = 2, shape2 = 2),
  gamma = map(sample_size, sample_anyDistribution, sample_fun = rgamma, shape = 2, scale = 1/4)
)
```
