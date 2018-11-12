sample_anyDistribution <- function(n, sample_fun = sample_fun, ...){
  
  # this function take a sample of size n 1000 times
  #inputs: 
  ## n = sample size
  ## sample_fun= any built in function in R that generates a random sample
  
  sample_fun(n = n*1000, ...) %>% matrix(nrow = n, ncol = 1000)
  
}

ks_rejection_rate <- function(sample1, sample2, alpha = 0.05){
  
  p_values <- map2_dbl(.x = sample1, .y = sample2, 
                       ~ ks.test(.x, .y , alternative = "two.sided")$p.value)
  mean(p_values < 0.05)
  
}


dist_comb <- function(n, samples_distributions){
  
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
  
  