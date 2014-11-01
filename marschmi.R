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








#Note: for histogram problem, you should have the word names on the x-axis and their frequency in the y-axis (hist will not work...)






readPaper <- function(file){
  #scan("mothur.txt", what = "list", sep = "") this one works.
  scan(file, what = list(""), sep = "") 
}
paper <- readPaper("mothur.txt")
#read about the scan function here: 
    #1. http://www.ats.ucla.edu/stat/r/modules/raw_data.htm
    #2. R help


wordCount <- function(filelist, word){
  filelist <- unlist(filelist)
  sum(filelist == word)
}
wordCount(paper, "mothur")

#Read about functions here:
  #1.  http://stackoverflow.com/questions/1923273/counting-the-number-of-elements-with-the-values-of-x-in-a-vector




Command | Input | Output | Functionality
`wordPlacement` | `filelist`, `word` | vector of numbers | if I supply the output from readPaper and a word, tell me the starting character position of that word indexed from the beginning of the paper
wordPlacement <- function(filelist, word){
  #if I supply the output from readPaper and a word, 
  #tell me the starting character position of that word 
  #indexed from the beginning of the paper
  
  filelist <- unlist(filelist)
  sum(filelist == word)
}
wordCount(paper, "mothur")

Command | Input | Output | Functionality
`wordHist` | `filelist`, `nwords=10`| histogram output and plot | Generate a histogram of how many times the top 10 words are used, but allow me to change the default number of "top words"


Command | Input | Output | Functionality
`nextWord` | `filelist`, `word` | vector of counts | if I give a word, tell me the frequency of words that follow it


Command | Input | Output | Functionality
`previousWord` | `filelist`, `word` | vector of counts | if I give a word, tell me the frequency of words that preceed it


Command | Input | Output | Functionality
`surpriseMe` | `filelist`, ??? | ??? |create a function "surpriseMe" that does a task of your choosing

