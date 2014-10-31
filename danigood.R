rm(list=ls())

# Making the function readPaper. Currently intimidated by such a task. 
# I'm going to look up scan and hopefully figure out what to do.
# So I want to make a function named readPaper that you can input any text file 
# name and the function will create a list of necessary info 
# (which is? text? title perhaps?) Looking over the file and other commands I think
# maybe just text? Let's jump in.

readPaper <- function(x){
	file <- scan(x, what = "")
	file <- as.list(file)
}