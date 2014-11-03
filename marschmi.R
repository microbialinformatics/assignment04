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
  list <- unlist(scan(file, what = list(""), sep = ""))#[[1]]
  list <- gsub("[[:punct:]]", "", list)
  list <- tolower(list)
}
paper <- readPaper("mothur.txt")
#read about the scan function here: 
    #1. http://www.ats.ucla.edu/stat/r/modules/raw_data.htm
    #2. R help
    #3. for gsub:  http://stackoverflow.com/questions/11498157/convert-punctuation-to-space


wordCount <- function(filelist, word){
  filelist <- unlist(filelist)
  sum(filelist == word)
}
wordCount(paper, "mothur")

#Read about functions here:
  #1.  http://stackoverflow.com/questions/1923273/counting-the-number-of-elements-with-the-values-of-x-in-a-vector


wordPlacement <- function(filelist, word){
  #tell me the starting character position of that word 
  which(filelist == word)
  #indexed from the beginning of the paper
}
wordPlacement(paper, "mothur")
#read about the which function here: 
    #1. R help

###########################################################################


Command | Input | Output | Functionality
`wordHist` | `filelist`, `nwords=10`| histogram output and plot | Generate a histogram of how many times the top 10 words are used, but allow me to change the default number of "top words"
wordHist <- function(filelist, top = 10){
  #Generate a histogram of how many times the top 10 words are used, 
  #but allow me to change the default number of "top words"
  pap <- as.data.frame(table(paper))
  colnames(pap) <- c("word", "freq")
  arg <- order(pap$freq, decreasing = TRUE)
  pap <- pap[arg, ]
  pap <- head(pap, n=20)
  x <- barplot(pap$freq, names = pap$word, col = "violetred", space = 1, 
               xaxt="n",xlab="", ylab = "Frequency", main = "Word Frequencies")
  labels <- pap$word
  text(x, par(“usr”)[3], labels = labels, srt = 45, adj = c(1.1,1.1), xpd = TRUE) 
  
  
  end_point = 0.5 + nrow(pap) + nrow(pap)-1 
  #labs <- paste(pap$word)#, "word")
  
  
  
  text(seq(1.5,end_point,by=2), par("usr")[3]-0.25, 
       srt = 60, adj= 1, xpd = TRUE, labels = paste(par$word))
  
  
  
  text(cex=1, x=x-.25, y=-10, labs, xpd=TRUE, srt=45)
  #barplot(pap$freq, names = pap$word, col = "violetred", 
  #        xaxt="n",xlab="", ylab = "Frequency", main = "Word Frequencies") 
  #axis(side=1,at=pap$word,labels=FALSE)
  #text(pap$word,par("usr")[3] - ofst, srt = g, adj = 1,labels=pap$word,xpd = TRUE)
}

wordHist(paper, top=20)
#Note: for histogram problem, 
#you should have the word names on the x-axis and their 
#frequency in the y-axis (hist will not work...)


text(pap$word, srt=45)


plot(yy,xx,xaxt="n",xlab="")
axis(side=1,at=xx,labels=FALSE)
text(xx,par("usr")[3] - ofst, srt = g, adj = 1,labels=labs,xpd = TRUE)



#Sources:
  #1.  http://www.dummies.com/how-to/content/how-to-sort-data-frames-in-r.html
  #2. http://haotu.wordpress.com/2013/07/09/angle-axis-x-labels-on-r-plot/

Command | Input | Output | Functionality
`nextWord` | `filelist`, `word` | vector of counts | if I give a word, tell me the frequency of words that follow it
 
nextWord <- function(filelist, word){
  something <- which(filelist == word)
  something2 <- something + 1
  paper[something2[1]]
  test<-(rep(NA,length(something2)))
    for(i in 1:length(something2)){
        test[i]<-  paper[something2[i]]
    }
  sort(table(test))
}
nextWord(paper, "data")




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










