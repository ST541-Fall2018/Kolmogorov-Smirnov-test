---
title: "Final Report"

output: 
  html_document:
    keep_md: true
---



# Q1


```r
# reading the results for answering first question
r_rate_10 <- read_rds(here("results", "rejection_rates_sample_10.rds"))
r_rate_50 <- read_rds(here("results", "rejection_rates_sample_50.rds"))
r_rate_100 <- read_rds(here("results", "rejection_rates_sample_100.rds"))

samples_size_10 <- read_rds(here("results", "simples_size_10.rds"))
samples_size_50 <- read_rds(here("results", "simples_size_50.rds"))
samples_size_100 <- read_rds(here("results", "simples_size_100.rds"))
```

```r
# making a dataframe of the rejection rates
pander::pander(data.frame(rejection_rate_10 = r_rate_10, 
           rejection_rate_50 = r_rate_50,
           rejection_rate_100 = r_rate_100,
           dist1 = samples_size_10$dist1,
           dist2 = samples_size_10$dist2))
```


--------------------------------------------------------------------------
 rejection_rate_10   rejection_rate_50   rejection_rate_100      dist1    
------------------- ------------------- -------------------- -------------
       0.042               0.885                 1              normal    

       0.089               0.999                 1              normal    

       0.063               0.951                 1              normal    

       0.049               0.658               0.951          exponential 

       0.015               0.218               0.425          exponential 

       0.021               0.199               0.366             beta     
--------------------------------------------------------------------------

Table: Table continues below

 
-------------
    dist2    
-------------
 exponential 

    beta     

    gamma    

    beta     

    gamma    

    gamma    
-------------

# Q2


```r
# reading the results for answering first question
r_rate_10 <- read_rds(here("results", "rejection_rates_sample_10_Q2.rds"))
r_rate_50 <- read_rds(here("results", "rejection_rates_sample_50_Q2.rds"))
r_rate_100 <- read_rds(here("results", "rejection_rates_sample_100_Q2.rds"))

samples_size_10 <- read_rds(here("results", "simples_size_10_Q2.rds"))
samples_size_50 <- read_rds(here("results", "simples_size_50_Q2.rds"))
samples_size_100 <- read_rds(here("results", "simples_size_100_Q2.rds"))
```


```r
# making a dataframe of the rejection rates
pander::pander(data.frame(rejection_rate_10 = r_rate_10, 
           rejection_rate_50 = r_rate_50,
           rejection_rate_100 = r_rate_100,
           dist1 = samples_size_10$dist1,
           dist2 = samples_size_10$dist2))
```


--------------------------------------------------------------------------
 rejection_rate_10   rejection_rate_50   rejection_rate_100      dist1    
------------------- ------------------- -------------------- -------------
       0.037               0.777               0.997            normal    

       0.095               0.998                 1              normal    

       0.353                 1                   1              normal    

       0.066               0.98                  1            exponential 

       0.215               0.984                 1            exponential 

       0.816                 1                   1               beta     
--------------------------------------------------------------------------

Table: Table continues below

 
-------------
    dist2    
-------------
 exponential 

    beta     

    gamma    

    beta     

    gamma    

    gamma    
-------------
    
