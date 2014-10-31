rm(list=ls())

# Making the function readPaper. Currently intimidated by such a task. 
# I'm going to look up scan and hopefully figure out what to do.
# So I want to make a function named readPaper that you can input any text file 
# name and the function will create a list of necessary info 
# (which is? text? title perhaps?) Looking over the file and other commands I think
# maybe just text? Let's jump in.

readPaper <- function(file){
	filelist <- scan(file, what = "")
	filelist <- as.list(filelist)
}

# Ok for this next function, I want to make a function named wordCount where 
# I input a list (readPaper output) and a word, and the output is a vector with one
# number that equals the number of times that word shows up. So for this,
# I'm going to want to do some sort of list = word thing and then since
# true=1, sum the vector and output said number. Is this case sensitive?
# May want to think about that.

wordCount <- function(filelist, word){
	count <- filelist == word
	sum(count)
}

# After consideration, case sensitivity is not something I think I can easily do
# since I do not know what words will be inputed. 

