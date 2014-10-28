#creating readPaper command that given a filename, creates a list of words
#in the paper 
#read in the words from the paper 
#source your file in R
read.delim("mothur.txt")
readPaper<-function(tf) {
  words<-scan(tf,"") #this vector is made of characters
  wordlist<-list()
  for( i in 1:length(words)) {
    wi<-words[i] #index of the word in the paper
    wordlist[[wi]]<- c(wordlist[[wi]],i)
  }
  return(wordlist)
}
mothurlist<-readPaper("mothur.txt")
mothurlist
#word count function
#tell how many times a word occurs in the paper
wordCount<-function(wordlist$word ) {
  freqword<-sapply(wordlist$word,length)
  return(freqword)
}

wordCount(mothurlist)
