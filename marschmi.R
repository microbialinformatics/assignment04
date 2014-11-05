rm(list=ls())
In addition, the R file should contain a commented block of text at the top of each function telling anyone how to run each commands. Also, the code should be well commented so that it is clear what each step does. I will test your code by running the following commands:
  source("marschmi.R")
paper <- readPaper("mothur.txt")    #I may use a different file
wordCount(paper, "mothur")          #I may use a different word
wordPlacement(paper, "mothur")      #I may use a different word
wordHist(paper)
wordHist(paper, top=20)
nextWord(paper, "mothur")           #I may use a different word
previousWord(paper, "mothur")       #I may use a different word
surpriseMe(paper)



#Below this line are my written functions
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
  pap <- as.data.frame(table(filelist))  #Make a data frame of all words in the list and its count.
  colnames(pap) <- c("word", "freq")  #Change column names to make them more accurate  
  arg <- order(pap$freq, decreasing = TRUE) #Order freq column by most to least abundant.
  pap <- pap[arg, ]  #Order dataframe by the most to least abundant based on freq column
  pap <- head(pap, n=top)  #take the number of rows from "top=?" input
  x <- barplot(pap$freq, names = pap$word, col = "royalblue", space = 1, #Make a barplot of frequency
               xaxt="n",xlab="", ylab = "Frequency", main = "Word Frequencies")
  labels <- pap$word  #Create vector of names
  text(x, x=x-.5, y=-3.5, labels = labels, srt = 45, pos = 1, xpd = TRUE) #Rotates labels so they look pretty.
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
  sort(table(test))  #Make a vector with next word and its counts and sort it by increasing abundance
}
nextWord(paper, "mothur")
#Sources:
  #1.  Help with graduate student: Daniel Katz in SNRE.
#########################


previousWord <- function(filelist, word){
  something <- which(filelist == word)  #Make a vector of indices of the occurences of the word of interest
  something2 <- something - 1  #Get the index of the word that preceeds the word of interest.
  test<-(rep(NA,length(something2)))   #Create a vector with the length of occurrences of the word of interest
  for(i in 1:length(something2)){
    test[i]<-  filelist[something2[i]]  #Make a vector of all of the previous words before the word of interest.
  }
  sort(table(test))  #Make a vector with previous word and its counts and sort it by increasing abundance
}
previousWord(paper, "mothur")
#Sources:
    #1.  Help with graduate student: Daniel Katz in SNRE.
#########################


surpriseMe <- function(filelist){
  letter_list <- toString(filelist) #Converts the list of words into a list of letters.
  letter_list <- gsub("[[:punct:]]", "", letter_list) #remove all of the punctuation.
  letter_list <- gsub("[[:space:]]", "", letter_list) #remove all spaces.
  letter_list <- gsub("[[:digit:]]", "", letter_list) #remove numerics.
  letter_list <- tolower(letter_list) #Just to make sure all letters are lowercase.
  oop <- strsplit(letter_list, split = "") #make each letter it's own unit.
  toop <- as.data.frame(table(oop)) #count each letter and make it a data frame.
  x <- barplot(toop$Freq, names.arg = toop$oop, col = "violetred", xaxt="n",
               xlab="Letter", ylab = "Frequency", main = "Letter Frequencies in filelist") #Plot the data with frequency on y axis and letter on x axis
  labels <- toop$oop  #Create vector of names
  text(x, x=x, y=-3.5, labels = labels, srt = 0, pos = 1, xpd = TRUE) #letter labels closer to x-axis.
}
surpriseMe(paper)
#########################
###########################################################################
#END









