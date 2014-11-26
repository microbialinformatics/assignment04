rm(list=ls())

# given a file name, create a list variable that contains any necessary
# information
readPaper <- function(file){
  paper <- scan(file, what="", quiet=T)
  return(list(words = paper))
}


# if I supply the output from readPaper and a word (or a vector of words), tell
# me how many times the word(s) shows up
wordCount <- function(fileList, word){
  count <- table(fileList[[1]])
  return(count[word])
}


# if I supply the output from readPaper and a word, tell me the starting
# character position of that word indexed from the beginning of the paper
wordPlacement <- function(fileList, word){
   which(fileList[[1]]==word)
}


# Generate a histogram of how many times the top 10 words are used, but allow me
# to change the default number of "top words"
wordHist <- function(fileList, nwords=10){
  count <- table(fileList[[1]])
  sorted <- sort(count, decreasing=T)

  par(mar=c(5, 5, 0.5, 0.5))
  b <- barplot(sorted[1:nwords], ylab="Times used", axes=F, axisnames=F, ylim=c(0,sorted[1]*1.05))
  axis(2)
  axis(1, at=b, label=names(sorted[1:nwords]), tick=F, las=3)
  box()
}


# if I give a word, tell me the frequency of words that follow it
nextWord <- function(fileList, word){
  location <- wordPlacement(fileList, word)
  nextWord <- fileList[[1]][location+1]
  sort(table(nextWord), decreasing=T)
}


# if I give a word, tell me the frequency of words that preceeds it
previousWord <- function(fileList, word){
  location <- wordPlacement(fileList, word)
  previousWord <- fileList[[1]][location-1]
  sort(table(previousWord), decreasing=T)
}
