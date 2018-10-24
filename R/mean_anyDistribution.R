mean_anyDistribution <- function(n, sample_fun= sample_fun, ...){
  # this fuction take take a sample size of n from a distribution 
  # and find the average value of the simulated sample
  # inputs of the functin are n = sample size
  # sample function = any built-in distributins in r such as runif, rnorm,...
  
  sample_fun(n = n, ...)
}


