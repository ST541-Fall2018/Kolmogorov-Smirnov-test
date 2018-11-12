---
title: "second question"
output: 
  html_document:
    keep_md: True
---



# Second Question

## Doing some silumations

In this section, I am taking samples of size 10, 50, and 100 from distributions with different means to address the second question in my project proposal.The distributions I have chosen for this projects are:

  1. $Normal(\mu = 1/2, \sigma^2 = 1) \text{,with the population mean of 1/2}$
  2. $exponential(\lambda = 1)\text{,with the population mean of 1}$
  3. $beta(\alpha = 2, \beta = 1)\text{,with the population mean of 2/3}$
  4. $gamma(\alpha = 2, \beta = 1)\text{,with the population mean of 2}$

Thes poolations have different means. I should repeat the process several times for different distributions and different sample sizes, and perform the KS test to see if the rejection rate gets close to 1 as the sample size increases.


```r
# Here is the data frame I created for different distributions and sample sizes

samples_distributions <- data_frame(
  sample_size = c(10, 50, 100),
  normal = map(sample_size, sample_anyDistribution, sample_fun = rnorm, mean = 1/2, sd = 1),
  exponential = map(sample_size, sample_anyDistribution, sample_fun = rexp, rate = 1),
  beta = map(sample_size, sample_anyDistribution, sample_fun = rbeta, shape1 = 2, shape2 = 1),
  gamma = map(sample_size, sample_anyDistribution, sample_fun = rgamma, shape = 2, scale = 1)
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
write_rds(samples_size_10, here("results", "simples_size_10_Q2.rds"))
write_rds(samples_size_50, here("results", "simples_size_50_Q2.rds"))
write_rds(samples_size_100, here("results", "simples_size_100_Q2.rds"))

write_rds(r_rate_10, here("results", "rejection_rates_sample_10_Q2.rds"))
write_rds(r_rate_50, here("results", "rejection_rates_sample_50_Q2.rds"))
write_rds(r_rate_100, here("results", "rejection_rates_sample_100_Q2.rds"))
```
