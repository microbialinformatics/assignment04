#creating readPaper command that given a filename, creates a list of words
#in the paper 
#read in the words from the paper 
#source your file in R
#read in the file
read.delim("mothur.txt")
##
###
#summary:
#Given a file name, this function will return a list containing every word in the file
readPaper<-function(file) {
  text<-scan(file,"") #this vector is made of characters
  wordlist<-list()
  for(i in 1:length(text)) {
    word<-text[i] #index of the word in the paper
    wordlist[[word]] <- c(wordlist[[word]],i)
  }
  return(wordlist) #return the list of words in the paper
}
#######################testing function
mothurlist<-readPaper("mothur.txt") #this tests the list
mothurlist # a test variable created to make sure the function worked
#word count function
##############################

#tell how many times a word occurs in the paper
#given a list containing the words in a file, tell how many times the word occurs
wordCount<-function (wordlist, aWord) {
  index.word<-(wordlist$aWord)) #store all locations of aWord
  vec.index.word<-as.vector(index.word, mode="numeric") #store as a vector to extract elements
  #return the length of the vector that has all occurences of word

  return(length(vec.index.word))
}
#test code
wordCount(mothurlist,improvement)
