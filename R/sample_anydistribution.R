#' Taking Samples of Size n for the Built-in R Density Functions
#' 
#' This function returns 1000 samples of size in using the built-in
#' density functions in R. The output is a matrix with 1000 columns and n rows.
#'
#' @param n sample size
#' @param sample_fun any built-in R density function that can take a random sample of a specified distribution
#' @param ... parameters corresponding to the specified distribution
#'
#' @return
#' @export
#'
#' @examples
#' 
#' # taking samples of size 10 from a normal distribution 
#' # with mean 0 and sd 1
#' 
#' sample_anyDistribution(n = 10, sample_fun = rnorm, mean = 0, sd = 1)

sample_anyDistribution <- function(n, sample_fun = sample_fun, ...){
  
  # this function take a sample of size n 1000 times
  #inputs: 
  ## n = sample size
  ## sample_fun= any built in function in R that generates a random sample
  
  sample_fun(n = n*1000, ...) %>% matrix(nrow = n, ncol = 1000)
  
}
