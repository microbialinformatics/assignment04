# readPaper: file to a list. 
#given a file name, create a list variable that contains any necessary information
#paper <- readPaper("mothur.txt") 
readPaper <- function(paper){
  paper <- scan(paper,"")   # list????????
  return(paper)
}




#wordCount: filelist, word to vector of numbers.
#if I supply the output from readPaper and a word (or a vector of words), tell me how many times the word(s) shows up
#wordCount(paper, "mothur")
wordCount <- function(paper,wd){
  count <- 0
  for(i in 1:length(paper)){
  if (paper[i] == wd){
    count <- count+1
  } 
  }
  return(count)
}



#wordPlacement: filelist, word to vector of numbers.
#if I supply the output from readPaper and a word, tell me the starting character position of that word indexed from the beginning of the paper
#wordPlacement(paper, "mothur")
wordPlacement <- function(paper,wd){
    for(i in 1:length(paper)){
    if (paper[i] == wd){ 
      break
    }
  }
  return(i)
}




#wordHist: filelist,nwords=10 to histogram output and plot.
#Generate a histogram of how many times the top 10 words are used, but allow me to change the default number of "top words"
#wordHist(paper, top=20)
wordHist <- function(paper,top=10){
  paper.vector <- unlist(paper)
  fre.list <- table(paper)
  sorted.list <- sort(fre.list,decreasing=T)
  wd.sorted <- head(sorted.list,top)
  wd.sorted.name <- names(wd.sorted)
                                     #how to plot histogram
  
  return(wd.sorted)
}







#nextWord: filelist, word to vector of counts.
#if I give a word, tell me the frequency of words that follow it
#nextWord(paper, "mothur")








#previousWord: filelist, word to vector of counts.
#if I give a word, tell me the frequency of words that preceed it
#previousWord(paper, "mothur")










#surpriseMe: filelist,??? to ????.
#create a function "surpriseMe" that does a task of your choosing
#surpriseMe(paper, ...)
