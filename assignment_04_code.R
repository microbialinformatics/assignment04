
# readpaper
# given a file name, create a list variable that contains any necessary information

readpaper <- function(file.name){
  #first read in the paper, pasting the filename into the path
file <- scan(file.name, what="character")
# now I have a vector that is each of the words in the file as a character strin

# I want a list that has each word, and its position

paper.list <- list()

# a list of each unique word in the file
paper.list[[1]] <- unique(file)

# the file vector itself
paper.list[[2]] <- file

# the position of each of those words - CHECK THIS - GET IT MATCHING EXACT STRING

for(i in 1:length(paper.list[[1]])){
paper.list[[i+2]] <- which(paper.list[[2]]==paper.list[[1]][i])
}

return(paper.list)
}

# read in from where my copy is stored
paper <- readpaper("~/assignment04/mothur.txt")

# wordCount: if I supply the output from readPaper and a word 
# (or a vector of words), tell me how many times the word(s) shows up


wordCount <- function(list, word){
 count <- which(list[[2]]==word)
 return(length(count))
}


wordCount(paper, "a")

# command wordPlacement

wordPlacement <- function(list, word){
  count <- which(paper[[1]]==word)
  return(list[[count+2]])
}

wordPlacement(paper, "primary")

# command wordHist: histogram output and plot | 
# Generate a histogram of how many times the top 10 words are used, 
# but allow me to change the default number of "top words"

wordHist <- function(list, n.words=10){
  lengths <- c()
  for(i in 3:816){
    lengths[i-2] <- length(list[[i]])
  }
  
  lengthmat <- data.frame(cbind(list[[1]], lengths))
  lengthorder <- order(lengths)
  
  orderedlength <- lengthmat[rev(lengthorder),]
  
  top.words <- orderedlength[1:n.words,2]
  top.words <- as.vector(top.words)
  top.words <- as.numeric(top.words)
  barplot(top.words, names.arg = orderedlength[1:n.words,1])
}

wordHist(paper)

# command nextWord

nextWord <- function(list, word){
  position <- which(list[[2]]==word)
  next.word <- list[[2]][position+1]
  return(next.word)
}

nextWord(paper, "the")

# command previousWord

previousWord <- function(list, word){
  position <- which(list[[2]]==word)
  next.word <- list[[2]][position-1]
  return(next.word)
}

previousWord(paper, "the")

# command surpriseMe - this is a function that plots a histogram of the number of 
# words between each two consecutive incidences of a word

surpriseMe <- function(list, word){
  actual <- which(list[[2]]==word)
  lags <- c()
  for(i in 2:length(which(list[[2]]==word))){
    lags[i-1] <- actual[i]-actual[i-1]
  }

  hist(lags)
}


surpriseMe(paper, "mothur")






