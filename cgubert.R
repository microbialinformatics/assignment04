readPaper function: given a file name, create a list variable that contains 
any necessary information

given a file name, create a list variable that contains 
any necessary information
PSEUDOCODE: iterate over "file name" (text file), find "sequences",
return in a list the information flanking this word
seqfind<-function(){
  info<-
    return(info)
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