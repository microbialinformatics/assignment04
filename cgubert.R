rm(list=ls())
#readPaper function: given a file name, create a list variable that contains 
#any necessary information
#PSEUDOCODE: produce text file in list format
readPaper<-function(text="mothur.txt"){
  paper<-scan(file=text,what="list",sep=" ")
    return(paper)
}

#2. if I supply the output from readPaper and a word (or a vector of words), 
#tell me how many times the word(s) shows up
#PSEUDOCODE: scan through output of readPaper, find word, for every instance 
#of the word add 1 to vector, return number of words
#hint: use TRUE/FALSE logicals in R
wordCount<-function(filelist=paper,word="mothur"){
  #conver file to all lowercase
  filelist<-tolower(filelist)
  #make it not a list
  charpaper<-unlist(filelist)
  #presence of word indicated with TRUE
  logic<-charpaper==word
  #TRUE=1, FALSE=0
  as.numeric(logic)
  #sum the TRUEs
  count<-sum(logic)
  #return the total number of words found
  return(count)
 }

#3. if I supply the output from readPaper and a word, 
#tell me the starting character position of that word 
#indexed from the beginning of the paper.
wordPlacement<-function(filelist=paper,word="mothur"){
  #convert file to all lowercase
  filelist<-tolower(filelist)
  #create a vector or seats where the word is
  placement<-which(paper=="mothur")
  #return the vector
  return(placement)
}

#4. Generate a histogram of how many times the top 10 words are used, 
#but allow me to change the default number of "top words"
wordHist<-function(filelist=paper,top=10){
  #convert file to all lowercase
  filelist<-tolower(filelist)
  #create a table of paper, giving frequencies of words used
  papertab<-table(paper)
  #sort table so popular words are listed last
  sortpapertab<-sort(papertab,increasing=TRUE)
  #make vector of popular words
  popwords<-tail(sortpapertab,n=top)
  #plot words against frequency
  popwordshist<-barplot(popwords,xlab="Top Words",ylab="Frequency",col="darkorchid4")
  return(popwordshist)
}

#5. if I give a word, tell me the frequency of words that follow it
#PSEUDOCODE: split up text file into segments divied after a given word, 
#make a table of each resulting segment that shows frequencies of words in 
#each segment/string
nextWord<-function(filelist=paper,word="mothur"){
  #convert file to all lowercase
  filelist<-tolower(filelist)
  #find the location of the given word
  placement<-which(filelist==word)
  #create vector the the next seat after the word
  nxt<-(placement+1)
  #give words from paper in seats identified in vector "nxt"
  nxtwords<-(paper[nxt])
  #tabulate the words and sort in increasing order of frequency
  nxttab<-table(nxtwords)
  nxttabsort<-sort(nxttab)
  return(nxttabsort)
}

#6. if I give a word, tell me the frequency of words that preceed it
previousWord<-function(filelist=paper,word="mothur"){
  #basically do the same thing as nextWords except...
  filelist<-tolower(filelist)
  placement<-which(filelist==word)
  #create vector the the next seat BEFORE the word
  prev<-(placement-1)
  prevwords<-(paper[prev])
  prevtab<-table(prevwords)
  prevtabsort<-sort(prevtab)
  return(prevtabsort)
}

#7. create a function "surpriseMe" that does a task of your choosing
#give the function a file and a word and it will split the text up into
#strings of text between that word. 
surpriseMe<-function(filelist=paper,word="mothur"){
  filelist<-tolower(filelist)
  complete<-paste(paper,sep=" ",collapse=" ")
  splitfile<-strsplit(complete,split=word)
  return(splitfile)
}