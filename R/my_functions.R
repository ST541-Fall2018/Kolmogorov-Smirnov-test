sample_anyDistribution <- function(n, sample_fun = sample_fun, ...){
  rerun(1000, sample_fun(n = n, ...))
  
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
  colnames(vals) <- c("distribution", "distribution2")
  
  
  samples_size_10 <- samples_distributions %>% 
    gather(key = "distribution", value = "samples", -sample_size) %>% filter(sample_size == n) %>% select(-"sample_size")  %>%
    mutate(distribution2 = distribution)
  
  b <- samples_size_10
  a <- vals
  dist1_index <- match(a$distribution,b$distribution)
  dist2_index <- match(a$distribution2,b$distribution2)
  data_final <- cbind(samples_size_10[dist1_index,] %>% select(-distribution2), samples_size_10[dist2_index,] %>% 
                     mutate(samples2 = samples) %>% select(-c(distribution, samples)))
  data_final
  
  
}
  
  