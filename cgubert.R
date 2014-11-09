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
wordHist<-function(filelist=paper,nwords=10){
  #convert file to all lowercase
  filelist<-tolower(filelist)
  #create a table of paper, giving frequencies of words used
  papertab<-table(paper)
  sortpapertab<-sort(papertab,)
  
  return()
}

apply(relabund,1,wilcox)

wilcox<-function(x){
  wilcox.test<-0
  for(i in x)
  wilcox.test<-wilcox.test+i
  return(p.value)   
}

test <- function(x, design){
  p <- wilcox.test(x~design)$p.value
  return(p)
}

p.values <- apply(relabund, 1, test, design=treatments)
padj.values <- p.adjust(p.values)