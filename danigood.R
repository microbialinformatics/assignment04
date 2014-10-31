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

# Ok next function. This one will be called wordPlacement and I will want to input
# a filelist (readPaper output) and a word and get out the positiion of each time
# that word appears in a vector of numbers.

wordPlacement <- function(filelist, word){
	which(filelist == word)
}

# I used this forum to find the 'which' function <http://ubuntuforums.org/showthread.php?t=939573>

# Onto the next function. So I want to make a function named wordHist that amkes
# a histogram for the number of times the top ten words are used, and I have to 
# make the input changeable for Pat to change the number of words to use. Yikes.

wordHist <- function(filelist, nwords=10){
	filelist <- unlist(filelist)
	filelist <- as.data.frame(table(filelist))
	filelist <- filelist[order(filelist$Freq, decreasing =TRUE), ]
	p <- filelist[1:nwords,]
	barplot(p$Freq, names.arg =factor(p$filelist), main = "Top Words", xlab = "Top Words in File", ylab= "Frequency")
}

# Boom! Man that was a pain.

