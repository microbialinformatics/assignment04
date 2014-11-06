rm(list=ls())


s = c("A","T","C","C","G")
count = 0
for(i in 1:length(s)){
  ifelse (s[i] == "C", count <- count + 1, count)
}
print(count)

s = c("A","T","C","C","G")
count = 0
i = 1
while(i <= length(s)){
  ifelse (s[i] == "C", count <- count + 1, count)
  i <- i+1
}
print(count)


#readPaper command
readPaper <- function(file){
  text <- scan(file,"")    #Reads txt file to create a string of characters
  text.list<- list(text)   #Creates a list of the previous string of characters
  return(text.list)
}

#wordCount command
wordCount <- function(filelist, word){
  vector <- unlist(filelist)   #Convert filelist to string
  TF <- vector == word
  total <- sum(TF)
  return(total)
}


#wordPlacement command
wordPlacement <- function(filelist, word){
  vector <- as.vector(filelist)   #Convert filelist to vector
  nword <- which(word==vector)    #Where the word is found
  return(nword)
}


#wordHist command
wordHist <- function(filelist, nwords=10){
  squared <- x^2
  sum.sq <- sum(squared)
  return(sum.sq)
}



#nextWord command
nextWord <- function(filelist, word){
  squared <- x^2
  sum.sq <- sum(squared)
  return(sum.sq)
}



#previousWord command
previousWord <- function(filelist,word){
  squared <- x^2
  sum.sq <- sum(squared)
  return(sum.sq)
}



#surpriseMe command
surpriseMe <- function(x){
  squared <- x^2
  sum.sq <- sum(squared)
  return(sum.sq)
}