rm(list=ls())
#readPaper function: given a file name, create a list variable that contains 
#any necessary information
#PSEUDOCODE: produce text file in list format
readPaper<-function(text){
  text.list<-scan(file=text,what="list",sep="\n")
    return(list(text.list))
}

#2. if I supply the output from readPaper and a word (or a vector of words), 
#tell me how many times the word(s) shows up
#PSEUDOCODE: scan through output of readPaper, find word, for every instance 
#of the word add 1 to vector, return number of words
#hint: use TRUE/FALSE logicals in R
wordCount<-function(paper,word){
  
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