rm(list=ls())


# readPaper command
# Input: a text file you wish to read
readPaper <- function(file){
  text <- scan(file,"")               # Reads txt file to create a string of characters
  lower.text <- tolower(text)         # Makes everything lowercase
  text.list<- list(lower.text)        # Creates a list of the previous string of characters
  return(text.list)
}

# References:
# tolower command found at "http://stackoverflow.com/questions/13640188/converting-text-to-lowercase"


# wordCount command
# Input: Output from readPaper function, word or vector of words of interest
wordCount <- function(filelist, word){
  vector <- unlist(filelist)   # Convert filelist to vector
  TF <- vector == word         # Creates TRUE/FALSE vector
  total <- sum(TF)             # Sum TRUEs
  return(total)
}


# wordPlacement command
# Input: Output from readPaper function, word of interest
wordPlacement <- function(filelist, word){
  vector <- unlist(filelist)      # Convert filelist to string
  nword <- which(word==vector)    # Where the word is found
  return(nword)
}

# References: 
# which function found with Help by searching ??indice



# wordHist command
# Input: Output from readPaper function, # of top words you want
wordHist <- function(filelist, nwords=10){
 file.table <- table(filelist)                      # Calculate frequency of each unique word in text
 sort.table <- sort(file.table, decreasing=T)       # Sort from highest to lowest
 barplot(sort.table[1:nwords], width=1, space=0, names.arg=rownames(sort.table[1:nwords]), main = "Top Words", xlab="Word",ylab="Frequency", )
 axis(1, labels=F, lwd.ticks=0)                     # Add x-axis w/o ticks
}

# References:
# table function found with Help by searching ??frequency



# nextWord command
# Input: Output from readPaper function, word of interest
# This command tells you the frequency of words that follow the first incidence of your word of interest
nextWord <- function(filelist, word){
  vector <- unlist(filelist)                 # Converts filelist to vector
  word.pos <- which(word==vector)            # Creates vector of word positions
  position <- word.pos[1]                    # Take the first word location
  leng <- length(vector)                     # Define length of filelist
  follow.words <- vector[position:leng]      # Creates vector from first occurance of word to end of filelist vector
  table <- table(follow.words)               # Calculate frequency of each word after target word
  matrix <- as.matrix(table)                 # Save frequencies as matrix
  return(matrix)
}



# previousWord command
# Input: Output from readPaper function, word of interest
# This command tells you the frequency of words that precede the first incidence of your word of interest
previousWord <- function(filelist,word){
  vector <- unlist(filelist)                 # Converts filelist to vector
  word.pos <- which(word==vector)            # Creates vector of word positions
  position <- word.pos[1]                    # Take the first word location
  precede.words <- vector[1:position]        # Creates vector from beginning of filelist vector to first occurance of word
  table <- table(precede.words)              # Calculate frequency of each word preceding target word
  matrix <- as.matrix(table)                 # Save frequencies as matrix
  return(matrix)
}



# surpriseMe command
# Input: Output from readPaper function
surpriseMe <- function(filelist){
  print("Are the authors of this article more eloquent* than Shakespeare?")
  print("(*measured by vocabulary size)")
  Shake.prop <- 5170/35000           # Shakespeare unique words / total words
  vector <- unlist(filelist)         
  table <- table(vector)             
  unique <- nrow(table)              # Calculate total # of unique words
  total <- length(vector)            # Calculate total length of filelist
  Shake.adj <- Shake.prop * total    # Subsample Shakespeare to reflect article length
  matrix <- matrix(c(unique, Shake.adj), nrow=2, ncol=1)     # Make matrix to present results
  colnames(matrix) <- "Unique words"
  rownames(matrix) <- c("Article","Shakespeare")
  print(matrix)
  conclusion <- ifelse (unique > Shake.adj, "Shakespeare ain't got nothin' on dem scientists", "The intellectuals doeth not compareth with the eloquence of Shakespeare")
  print("Conclusion:")
  return(conclusion)
}

# References:
# Shakespeare vocabulary data from "http://experiments.undercurrent.com/"
# Shakespeare translation from "http://lingojam.com/EnglishtoShakespearean"
