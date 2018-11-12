sample_anyDistribution <- function(n, sample_fun = sample_fun, ...){
  
  # this function take a sample of size n 1000 times
  #inputs: 
  ## n = sample size
  ## sample_fun= any built in function in R that generates a random sample
  
  sample_fun(n = n*1000, ...) %>% matrix(nrow = n, ncol = 1000)
  
}

ks_rejection_rate <- function(X1, X2, alpha = 0.05){
  
  # this function takes two matrices of the generated random samples
  # and returns proportion of rejection rates after performing ks.test
  
  # inputs:
  ## X1 = matrix one of the size of n*1000
  ## X2 = matrix 2 of the size of n*1000
  ## alpha = significance level
  
  pvalues <- double(1000)
  for (i in 1:1000){
    pvalues[i] <- ks.test(X1[,i], X2[,i], alternative = "two.sided")$p.value
  }

  mean(pvalues < 0.05)
  
}


dist_comb <- function(n, samples_distributions){
  
  # this function gets a dataframe of genereated samples
  # with a column of sample size and some other columns of distributions
  #the output is a dataframe of two by two combinations of the distributions
  # with the specified sample size
  # inputs:
  ## n = sample size
  ## samples_distributions = original data frame
  
  dists <- colnames(samples_distributions)[-1]
  vals <- c(dists, dists )
  
  vals <- unique(vals) %>% combn(., 2) %>% t(.)
  vals <- data.frame(vals)
  colnames(vals) <- c("dist1", "dist2")
  
  
  samples_size_10 <- samples_distributions %>% 
    gather(key = "dist1", value = "samples", -sample_size) %>% 
    filter(sample_size == n) %>% select(-"sample_size")  %>%
    mutate(dist2 = dist1)
  
  b <- samples_size_10
  a <- vals
  dist1_index <- match(a$dist1,b$dist1)
  dist2_index <- match(a$dist2,b$dist2)
  data_final <- cbind(samples_size_10[dist1_index,] %>% 
                        select(-dist2), samples_size_10[dist2_index,] %>% 
                     mutate(samples2 = samples) %>% select(-c(dist1, samples)))
  data_final
  
  
}
  
  