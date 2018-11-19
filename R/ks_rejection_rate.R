#' Kolmogorov Smirnov Rejection Rate
#'
#' This function finds the rejection rate of Kolmogorov Smirnov test for two distributions. 
#' 
#' The inputs of the function is two matrices of samples of two different distributions. 
#' Number of rows if the sample size and number of columns is 1000 which is the number of generated samples
#' from the distributions. The output is the number of times the test rejects the null hypothesis.
#' 
#' @param X1 matrix of the first distribution 
#' @param X2 matrix of the second distribution.
#' @param alpha significance level (defaul is 0.05)
#'
#' @return
#' @export
#'
#' @examples
#' 
#' # 1000 samples of size 10 generated from 
#' # a normal distribution with mean of 0 and sd of 1
#' X1 <- rnorm(1000*10, mean = 0, sd = 1) %>%
#'  matrix(ncol = 1000, nrow = 10)
#' 
#' # 1000 samples of size 10 generated from 
#' # a exponential distribution with rate of 1
#' 
#' X2 = rexp(1000*10, rate = 1) %>% 
#' matrix(ncol = 1000, nrow = 10)
#' 
#' rejection_rate <- ks_rejection_rate(X1 = X1, 
#' X2 = X2, alpha = 0.05)
#' 
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