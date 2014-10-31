rm(list=ls())




#readPaper command
readPaper <- function(file){
  text <- scan(file,"")    #Reads txt file to create a string of characters
  text.list<- list(text)   #Creates a list of the previous string of characters
  
  return(text.list)
}

#wordCount command
wordCount <- function(filelist, word){
  vector <- as.vector(filelist)
  for(i in 1:lenght(vector)){
    
    print(i)
  }
  
  return(sum.sq)
}


#wordPlacement command
wordPlacement <- function(filelist, word){
  squared <- x^2
  sum.sq <- sum(squared)
  return(sum.sq)
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