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
#given a list containing the words in a file, 
#tell how many times the word occurs
#provide list and "word". the word must be in "" 
wordCount<-function(x, y) {
  index.word<-x[[y]] #store all locations of word
  vec.index.word<-as.vector(index.word, mode="numeric") 
#store as a vector to extract elements
  #return the length of the vector that has all occurences of word
return(length(vec.index.word))
}

##########################
#3.
#function prints character position of word from begining of paper
#NOTE:assuming characters are the words in the paper not the individual numbers + spaces
#I tried to do this with letters+spaces by making all of the words in the paper into a string
#and then tried to count the location in the string but it was getting complicated and we
#didnt cover that in class so I think this is what you are asking for in this question?
#if not I can add the code i attempted 

#provide (x) a list of words indexed from a text file, and
#("y"), a word to find it's locations.
WordPlacement<-function(x, y){
index.word<-x[[y]]#locations of the word
print(index.word)
}
####test code
WordPlacement(mothurlist, "this")
###########################
#4.
#create histogram of occurences of top n words in a list
#provide the list of words(wordlist), and (n), a number of top words
#return their frequencies in a rainbow histogram
wordHist<-function(wordlist,n){
  freqs<-sapply(wordlist,length)#wordlist frequency list
  ranklist<-sort(freqs, decreasing=T) #sort the frequency list by rank
  freqsort<-ranklist[n:1] #new list of frequencies in range <=n
  return(barplot(freqsort, xlab="word", ylab="frequency",main=("frequency of word in paper"),col=c(1:500)))
}

####test code
wordHist(mothurlist,17)  
  
############################
#5.
#function tells frequency of words in list (x) after word given(y)
nextWord<-function(x, y) {
  #x has all words as variables with their location
  index.word<-x[[y]] #store locations of word given
  nextwordnames<-x[(index.word+1)] #find location of words that come after these locations
  nextwordsum<-summary(nextwordnames)
  vecnextwordsum<-nextwordsum[,!(colnames(nextwordsum) %in% c("Class","Mode"))]
  return(vecnextwordsum)
}
##test code
nextWord(mothurlist,"the")

  
#############################
#6.given word, tell frequency of previous word
#function tells frequency of words in list (x) after word given(y)
previousWord<-function(x, y){
  #x has all words as variables with their location
  index.word<-x[[y]] #store locations of word given
  nextwordnames<-x[(index.word-1)] #find location of words that come after these locations
  nextwordsum<-summary(nextwordnames)
  vecnextwordsum<-nextwordsum[,!(colnames(nextwordsum) %in% c("Class","Mode"))]
  return(vecnextwordsum)
}
#####test code
previousWord(mothurlist,"mothur")
##############################
#7.
#surprise function that does something
#find all times a word of interest occurs in the paper
#replace this word with different relatives
#give l= "file.txt", "w"= a word in the file
#replace that word with mothur's relatives
#example("mothur.txt, "mothur")
surpriseMe<-function(l, w) {
  wordlist<-scan(l,"")#create list from file
  charlist<-(strwrap(wordlist, simplify=T)) #make this list a character 
             vecreplist<-grep(w, charlist) #make vector of locations of the word in the list
             better<-(replace(charlist, vecreplist, c("brothur","sistur","son","daughtur","grandmothur","grandfathur","grandson","granddaughtur","uncle","aunt","cousin","nephew","niece","fathur-in-law","mothur-in-law","brothur-in-law","sistur-in-law","great-grandfathur","great-grandmothur","step-daughtur","step-fathur","step-mothur","step-brothur","step-sistur","step-son"))) 
  best<-cat(strwrap(better, simplify=T), sep=" ") #convert to wrap-text paper format
  print(best)
}


###################
#sources
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/strwrap.html
#https://stat.ethz.ch/R-manual/R-devel/library/grDevices/html/palettes.html
#http://www.manythings.org/vocabulary/lists/a/words.php?f=relatives
