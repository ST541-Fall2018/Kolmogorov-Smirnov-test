---
title: "haddadis-project-KStest"

output:
  html_document:
    keep_md: true
---



# First Question

## Doing some silumations

In this section, I am taking samples of size 10, 100, and 1000 from distributions with the same means and different distributions to address the first question in my project proposal. In this regard, a function `sample_anyDistribution.R` is created and saved in the R directory. Inputs of the functions are sample size (n) and a distribution (sample_fun). The function takes the inputs arguments and the output is a sample of size n from the specified distribution. The distributions I have chosen for this projects are:

  1. $Normal(\mu = 1/2, \sigma^2 = 1)$
  2. $exponential(\lambda = 2)$
  3. $beta(\alpha = 2, \beta = 2)$
  4. $gamma(\alpha = 2, \beta = 1/4)$

All these distributions have the same population means (0.5). I should repeat the process several times for different distributions and different sample sizes, and perform the KS test to see if the rejection rate gets close to the significance level as the sample size increases.



```r
# Here is the data frame I created for different distributions and sample sizes



samples_distributions <- data_frame(
  sample_size = c(10, 50, 100),
  normal = map(sample_size, sample_anyDistribution, sample_fun = rnorm, mean = 1/2, sd = 1),
  exponential = map(sample_size, sample_anyDistribution, sample_fun = rexp, rate = 2),
  beta = map(sample_size, sample_anyDistribution, sample_fun = rbeta, shape1 = 2, shape2 = 2),
  gamma = map(sample_size, sample_anyDistribution, sample_fun = rgamma, shape = 2, scale = 1/4)
)


samples_size_10 <- dist_comb(n = 10, samples_distributions)
samples_size_50 <- dist_comb(n = 50, samples_distributions)
samples_size_100 <- dist_comb(n= 100, samples_distributions)


m <- dim(samples_size_10)[1] #number of rows
r_rate_10 <- double(m)
for (i in 1:m){
  x <- samples_size_10 %>% slice(i)
  r_rate_10[i] <- ks_rejection_rate(x$samples[[1]], x$samples2[[1]])
}

r_rate_50 <- double(m)
for (i in 1:m){
  x <- samples_size_50 %>% slice(i)
  r_rate_50[i] <- ks_rejection_rate(x$samples[[1]], x$samples2[[1]])
}

r_rate_100 <- double(m)
for (i in 1:m){
  x <- samples_size_100 %>% slice(i)
  r_rate_100[i] <- ks_rejection_rate(x$samples[[1]], x$samples2[[1]])
}

# saving the results
write_rds(samples_size_10, here("results", "simples_size_10.rds"))
write_rds(samples_size_50, here("results", "simples_size_50.rds"))
write_rds(samples_size_100, here("results", "simples_size_100.rds"))

write_rds(r_rate_10, here("results", "rejection_rates_sample_10.rds"))
write_rds(r_rate_50, here("results", "rejection_rates_sample_50.rds"))
write_rds(r_rate_100, here("results", "rejection_rates_sample_100.rds"))
```
