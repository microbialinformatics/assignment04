#readPaper Function 
#Input a file name, and create a list variable that contains necessary information
#For exmaple: paper <- readPaper("mothur.txt") 
readPaper <- function(paper){
  paper <- scan(paper,"")                   #read file
  paper <- list(paper)                      #convert it to a list
  return(paper)                             #return the list
}




#wordCount Function
#Calculate how many times the word(s) shows up in a file
#For example: wordCount(paper, "mothur")
wordCount <- function(paper,wd){
  count <- 0                                #set initial counts
  paper.vector <- unlist(paper)             #convert list to vector
  for(i in 1:length(paper.vector)){         #for loop: from the fist vector to the last vector
  if (paper.vector[i] == wd){
    count <- count+1                        #if find the target word, count+1
  } 
  }
  return(count)                             #return counts
}



#wordPlacement Function
#Find the starting character position of the word in the file
#For example: wordPlacement(paper, "mothur")
wordPlacement <- function(paper,wd){
  paper.vector <- unlist(paper)             #convert list to vector
  for(i in 1:length(paper.vector)){         #for loop: from the beginning to the end
    if (paper.vector[i] == wd){ 
      break                                 #when find the target word, stop the loop
    }
  }
  return(i)                                 #return the position of the word
}




#wordHist Function
#Generate a plot of most frequently used words in the file
#For example: wordHist(paper, top=20)
wordHist <- function(paper,top=10){
  paper.vector <- unlist(paper)                 #convert list to vector
  fre.list <- table(paper)                      #find out the frequency of all words
  sorted.list <- sort(fre.list,decreasing=T)    #sort the words by decreasing frequency
  wd.sorted <- head(sorted.list,top)            #only show the top words
  wd.sorted.name <- names(wd.sorted)            #show the words' name
  plot <- barplot(sorted.list[1:top],xlab="Words",ylab="Used time",main="Used times of words",axes=TRUE)
                                                #plot the words with frequency   
  return(wd.sorted[1:top])                      #return the words and its frequency
}



#nextWord Function
#Show the frequency of unknown word that follow the known word
#For example: nextWord(paper, "mothur")
nextWord <- function(paper,wd){
  count <- 0                                   #set initial count as 0
  paper.vector <- unlist(paper)                #convert list to vector
    for(i in 1:length(paper.vector)){          #for loop: from the beginning to the end
    if (paper.vector[i] == wd){                #find the known word
      wd.next <- paper.vector[i+1]             #set the unknown word and break
      break                                    
    }
    }
    for(j in 1:length(paper.vector)){          #for loop: from the beginning to the end
      if(paper.vector[j]== wd.next){           #find the unknown word and increase count by 1 each time
        count <- count+1                       
        wd.count <- c(wd.next,count)
      }
    }
   return(wd.count)                            #return the unknown word and frequency
}
  



#previousWord Function
#Show the frequency of unknown word that before the known word
#previousWord(paper, "mothur")
previousWord <- function(paper,wd){           
  count <- 0                                   #set initial count as 0
  paper.vector <- unlist(paper)                #convert list to vector
  for(i in 1:length(paper.vector)){            #define the unknown word
    if (paper.vector[i] == wd){
      wd.next <- paper.vector[i-1]
      break
    }
  }
  for(j in 1:length(paper.vector)){            #find the unknown word and increase count by 1 each time found
    if(paper.vector[j]== wd.next){
      count <- count+1
      wd.count <- c(wd.next,count)
    }
  }
  return(wd.count)                             #return the unknown word and frequency
}



#surpriseMe Function
#Replace a specific word in the file with another word or sentence
#For example: surpriseMe(paper,"mothur","Happy_Halloween")
supriseMe <- function(paper,wd1,wd2){
  paper.vector <- unlist(paper)                #convert list to vector
  for(i in 1:length(paper.vector)){            #find the old word and replace it with new word
    if (paper.vector[i] == wd1){ 
      paper.vector[i] <- wd2
    }
  }
  paper <- list(paper.vector)                  #convert vector to list
  return(paper)                                #return the new file
}
