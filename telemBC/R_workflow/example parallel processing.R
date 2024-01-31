# ===============================================================================
# Name   	: Parallel processing example
# Author 	: Filippo Ferrario 
# Date   	:  [dd-mm-yyyy] 31-01-2024
# Version	: 0.1
# URL		: 
# Aim    	: Provide an example on how to use parallel processing in R
# ===============================================================================


#' # Parallel processing example
#' 
#' This script is an example on how to use parallel processing in R.  
#' Parallel processing is usefull to speed up calculations taking advantage of more than 1 core, if these are available on your pc.  
#'  
#' ## Create a dummy dataset
#' # -----------------------------
# create a dataset

my_data<- data.frame('site'=c(rep(paste0('site_0',1:9),each=100),rep('site_10',100)) , value=rnorm(1000))

my_data$site<-as.factor(my_data$site)

summary(my_data)

my_data %>%
	group_by(site) %>%
	summarize(n_obs=n())

#' `my_data` is a dataset that has 10 sites and for each site there are 100 measured values of something.
#' 
#' 
#' We will first produce a job that will run in a serial way, i.e., using just one core.
