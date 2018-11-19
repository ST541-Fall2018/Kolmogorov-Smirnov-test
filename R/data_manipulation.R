#' Two by Two Combinations of Distributions
#'
#' This function takes a data frame with different columns of samples with different distributions
#' and makes the two by to combination of the samples.
#' 
#' The data frame should have a specific format. The first column should be sample size and the consequent 
#' columns should have samples of different distributions. The output has four columns: name of the first distribution, 
#' name of the second distribution, the first distribution samples, and the second distribution samples.
#' 
#'
#' @param n sample size
#' @param samples_distributions dataframe of the distributions
#'
#' @return
#' @export
#'
#' @examples
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
  
  