rm(list=ls())
In addition, the R file should contain a commented block of text at the top of each function telling anyone how to run each commands. Also, the code should be well commented so that it is clear what each step does. I will test your code by running the following commands:
setwd("/Users/marschmi/assignment04")  
  source("XXXXXXXX.R")
paper <- readPaper("mothur.txt")    #I may use a different file
wordCount(paper, "mothur")          #I may use a different word
wordPlacement(paper, "mothur")      #I may use a different word
wordHist(paper)
wordHist(paper, top=20)
nextWord(paper, "mothur")           #I may use a different word
previousWord(paper, "mothur")       #I may use a different word
surpriseMe(paper, ...)

###########################################################################

readPaper <- function(file){
  list <- unlist(scan(file, what = list(""), sep = ""))# Read in the text file.
  list <- gsub("[[:punct:]]", "", list) #remove all of the punctuation
  list <- tolower(list) # change all words to lowercase so "As" and "as" clump together as the same thing.
}
paper <- readPaper("mothur.txt")
#read about the scan function here: 
    #1. http://www.ats.ucla.edu/stat/r/modules/raw_data.htm
    #2. R help
    #3. for gsub:  http://stackoverflow.com/questions/11498157/convert-punctuation-to-space
#########################


wordCount <- function(filelist, word){
  sum(filelist == word)  #make a vector of Trues/Falses for every word.  Sum up the matches(trues).
}
wordCount(paper, "mothur")
#Read about functions here:
  #1.  http://stackoverflow.com/questions/1923273/counting-the-number-of-elements-with-the-values-of-x-in-a-vector
#########################

wordPlacement <- function(filelist, word){
  which(filelist == word)  #The which function gives the index of a logical object and outputs an array of indices.
}
wordPlacement(paper, "mothur")
#read about the which function here: 
    #1. R help
#########################


wordHist <- function(filelist, top = 10){
  #Generate a histogram of how many times the top 10 words are used, 
  #but allow me to change the default number of "top words"
  pap <- as.data.frame(table(filelist))
  colnames(pap) <- c("word", "freq")
  arg <- order(pap$freq, decreasing = TRUE)
  pap <- pap[arg, ]
  pap <- head(pap, n=top)
  x <- barplot(pap$freq, names = pap$word, col = "royalblue", space = 1, 
               xaxt="n",xlab="", ylab = "Frequency", main = "Word Frequencies")
  labels <- pap$word
  text(x, x=x-.5, y=-3.5, labels = labels, srt = 45, pos = 1, xpd = TRUE)
}
wordHist(paper, top=20)
#Sources:
  #1. http://www.dummies.com/how-to/content/how-to-sort-data-frames-in-r.html
  #2. http://haotu.wordpress.com/2013/07/09/angle-axis-x-labels-on-r-plot/
  #3. http://stackoverflow.com/questions/20241388/rotate-x-axis-labels-45-degrees-on-grouped-bar-plot-r
#########################


nextWord <- function(filelist, word){
  something <- which(filelist == word)  #Make a vector of indices of the occurences of the word of interest
  something2 <- something + 1  #Get the index of the word that follows the word of interest.
  test<-(rep(NA,length(something2)))   #Create a vector with the length of occurrences of the word of interest
    for(i in 1:length(something2)){
        test[i]<-  filelist[something2[i]]  #Make a vector of all of the next words following the word of interest.
    }
  sort(table(test))  #Make a vector with word and its counts and sort it by increasing abundance
}
nextWord(paper, "data")
#Sources:
  #1.  Help with graduate student: Daniel Katz in SNRE.
#########################


###########################################################################

Command | Input | Output | Functionality
`previousWord` | `filelist`, `word` | vector of counts | if I give a word, tell me the frequency of words that preceed it
previousWord <- function(filelist, word){
  something <- which(filelist == word)
  something2 <- something - 1
  paper[something2[1]]
  test<-(rep(NA,length(something2)))
  for(i in 1:length(something2)){
    test[i]<-  paper[something2[i]]
  }
  sort(table(test))
}
previousWord(paper, "data")

Command | Input | Output | Functionality
`surpriseMe` | `filelist`, ??? | ??? |create a function "surpriseMe" that does a task of your choosing
surpriseMe <- function(filelist, word){
  
}
surpriseMe(paper, "data")










