rm(list=ls())

#The readPaper function reads a given text file and records the occurrence of every word in a list.  A text file is required from the user.

readPaper<-function(file){
  text<-tolower(scan(file,"")) #Reads in text file, recording frequencies of words as defined by blank spaces and converts them to lowercase letters
  allwords<-list() #Defines "allwords" as a list
  for(i in 1:length(text)){ #Specifies a loop that continues until reaching the final word in the list of words
    word<-text[i] #Stores word at given point "i" as separate vector
    allwords[[word]]<-c(allwords[[word]],i) #Stores all words and their frequencies as a list
  }
  return(allwords)
}

#The wordCount function lists the frequency of a given word when provided with a list of words and their frequencies.

wordCount<-function(filelist,word){
  positions<-filelist[[word]] #Stores the position(s) of a given word from the list of words/frequencies
  return(length(positions))
}

#The wordPlacement function lists the position(s) of a given word in the original text

wordPlacement<-function(filelist,word){
  positions<-filelist[[word]] #Stores the position(s) of a given word from the list of words/frequencies
  return(positions)
}

#The wordHist function takes the words that appear most frequently and displays them in a histogram.  The number of words shown is 10 by default but can also be specified by the user.

wordHist<-function(filelist,top=10){
  frequencies<-sapply(filelist,length) #Uses "sapply" function to sort the frequencies into a vector
  orderedlist<-sort(frequencies, decreasing=T) #Sorts the words and associated frequencies by decreasing frequency
  histogram<-barplot(orderedlist[1:top],main="Word Frequencies") #Plots histogram
  return(histogram)
}

#The nextWord function identifies and shows the frequencies of all words that come after a user-given word.

nextWord<-function(filelist,word){
  index<-filelist[[word]] #Identifies the positions of the user-given word
  nextWords<-filelist[(index[1]+1):length(filelist)] #Stores the words that follow the FIRST appearance of the given word and their associated frequencies
  return(nextWords)
}

#The previousWord function identifies and shows the frequencies of all words that come after a user-given word.

previousWord<-function(filelist,word){
  index<-filelist[[word]] #Identifies the positions of the user-given word
  previousWords<-filelist[1:(index[1])] #Stores the words that precede the FIRST appearance of the given word and their associated frequencies
  previousWords2<-head(previousWords,-1) #Deletes the given word (the final entry in the list) off of the list of words that precede it
  return(previousWords2)
}

#The surpriseMe function lets the user know if a particular file is worth reading based on its number of words.

surpriseMe<-function(filelist){
  print("Should I read this?") #Prompts the question of interest
  total<-sum(sapply(filelist,length)) #Adds together the frequencies of all the words to find the total number of words
  if(total<=100){
    print("Sure, it's a quick read") #Response for less than 100 words
  } else if(total>100&total<=500){
    print("It's a pretty short read") #Response for between 100 and 500 words
  } else if(total>500&total<=1500){
    print("It won't kill you") #Response for between 500 and 1500 words
  } else if(total>1500&total<=3000){
    print("It could be worse") #Response for between 1500 and 3000 words
  } else if(total>3000&total<=6000){ 
    print("Wow, this is long...") #Response for between 3000 and 6000 words
  } else{
    print("...I wouldn't :)") #Response for over 6000 words
  }
}


#I referred to some of the later pages of the R programming textbook for help on the first readPaper function