#creating readPaper command that given a filename, creates a list of words
#in the paper 
#read in the words from the paper 
#source your file in R
#read in the file
read.delim("mothur.txt")
##
##########################
#summary:
#Given a file name, this function will return 
# a list containing every word in the file
#1
readPaper<-function(file) {
  text<-scan(file,"") #this vector is made of characters
  wordlist<-list()
  for(i in 1:length(text)) {
    word<-text[i] #index of the word in the paper
    wordlist[[word]] <- c(wordlist[[word]],i)
  }
  return((wordlist)) #return the list of words in the paper
}
#######################testing function
mothurlist<-readPaper("mothur.txt") #this tests the list
mothurlist # a test variable created to make sure the function worked
#word count function
##############################
#2.
#tell how many times a word occurs in the paper
#given a list containing the words in a file, tell how many times the word occurs
wordCount<-function(x, y) {
  ###problem!!
  index.word<-x[[y]] #store all locations of word
  vec.index.word<-as.vector(index.word, mode="numeric") 
#store as a vector to extract elements
  #return the length of the vector that has all occurences of word
return(length(vec.index.word))
}
#test code
wordCount(mothurlist,this)

##########################
#3.
#function prints character position of word from begining of paper
WordPlacement<-function(wordlist, word){
  #create vector from list where letters and spaces become a single string
  #find locations where word is present
  #print location of first letter
  ulwordlist<-unlist(wordlist)
  return(ulwordlist)
}
####test code
WordPlacement(mothurlist)
###########################
#4.
#create histogram of occurences of top 10 words in paper
#given list of words in paper and a number of top words
wordHist<-function(wordlist,nwords){
  noccurword<-nchar(wordlist) #vector with each word and its frequency
  sort.occur.word<-sort(noccurword) #sort by times each word occurs
  rank<-.....#create variable to contain the rank of each word
  #make historgram of <=rank of nwords
  

  }
  
return(hist(topnwords))
}
############################
#5.
#function tells frequency of words after word given
nextWord<-function(wordlist, word){
  #make wordlist a vector
  #create vector containing all of the words word +1
  #get names and counts of words in +1 vector
  return(countvector)
}
#############################
#6.given word, tell frequency of previous word
#same code as above but it will be word -1
previousWord<-function(wordlist, word){
  #
  #
  return(countvector)
}
##############################
#7.
#surprise function that does something
#find all the mothur's in the paper
#replace them with different relatives
surpriseMe<-function(l, w) {
  wordlist<-scan(l,"")
  charlist<-(strwrap(wordlist, simplify=T))
             vecreplist<-grep("w", charlist)
             print(replace(charlist,vecreplist, c("fathur",
                                 "brothur",
                                 "sistur",
                                 "son",
                                 "daughtur",
                                 "grandmothur",
                                 "grandfathur",
                                 "grandson",
                                 "granddaughtur",
                                 "uncle",
                                 "aunt",
                                 "cousin",
                                 "nephew",
                                 "niece",
                                 "fathur-in-law",
                                 "mothur-in-law",
                                 "brothur-in-law",
                                 "sistur-in-law",
                                 "great-grandfathur",
                                 "great-grandmothur",
                                 "step-daughtur",
                                 "step-fathur",
                                 "step-mothur",
                                 "step-brothur",
                                 "step-sistur",
                                 "step-son",
                                 "step-uncle",
                                 "step-aunt",
                                 "step-grandfathur",
                                 "step-grandmothur",
                                 "half-brothur",
                                 "half-sistur",
                                 "ex-husbund",
                                "ex-wife")))
}

###################
#sources
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/strwrap.html
