
#we are going to learn how to write functions
rescale <- function(x) {
  rng <- range(x) 
(x-rng[1])/(rng[2]-rng[1])
}

rescale

#test on sample

rescale(1:10)

rescale(c(1,4,10,20))
