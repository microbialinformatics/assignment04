rm(list=ls())


s = c("A","T","C","C","G")
count = 0
for(i in 1:length(s)){
  ifelse (s[i] == "C", count <- count + 1, count)
}
print(count)

s = c("A","T","C","C","G")
count = 0
i = 1
while(i <= length(s)){
  ifelse (s[i] == "C", count <- count + 1, count)
  i <- i+1
}
print(count)


nameswitch <- function(names){
  split.names <- strsplit(names," ")
  split.names <- unlist(split.names)
  new.names <- paste(split.names[2],split.names[1],sep=", ")
  return(new.names)
  vapply(names,)
}

convert.names <- sapply(names,nameswitch)
sortednames <- sort(convert.names)






#readPaper command
readPaper <- function(file){
  text <- scan(file,"")    #Reads txt file to create a string of characters
  text.list<- list(text)   #Creates a list of the previous string of characters
  return(text.list)
}

#wordCount command
wordCount <- function(filelist, word){
  vector <- unlist(filelist)   #Convert filelist to string
  TF <- vector == word         #Creates TRUE/FALSE string
  total <- sum(TF)             #Sum TRUEs
  return(total)
}


#wordPlacement command
wordPlacement <- function(filelist, word){
  vector <- unlist(filelist)   #Convert filelist to string
  nword <- which(word==vector)    #Where the word is found
  return(nword)
}

##which function found with Help by searching ??indice



#wordHist command
wordHist <- function(filelist, nwords=10){
 file.table <- table(filelist)                      ##Calculate frequency of each unique word in text
 sort.table <- sort(file.table, decreasing=T)    ##Sort from highest to lowest
 barplot(sort.table[1:nwords], width=1, space=0, names.arg=rownames(sort.table[1:nwords]), main = "Top Words", xlab="Word",ylab="Frequency", )
 axis(1, labels=F, lwd.ticks=0)                     ##Add x-axis w/o ticks
}

##table function found with Help by searching ??frequency



#nextWord command
nextWord <- function(filelist, word){
  squared <- x^2
  sum.sq <- sum(squared)
  return(sum.sq)
}



#previousWord command
previousWord <- function(filelist,word){
  squared <- x^2
  sum.sq <- sum(squared)
  return(sum.sq)
}



#surpriseMe command
surpriseMe <- function(x){
  squared <- x^2
  sum.sq <- sum(squared)
  return(sum.sq)
}