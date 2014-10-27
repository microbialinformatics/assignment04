# readPaper: file to a list. 
#given a file name, create a list variable that contains any necessary information
#paper <- readPaper("mothur.txt") 





#wordCount: filelist, word to vector of numbers.
#if I supply the output from readPaper and a word (or a vector of words), tell me how many times the word(s) shows up
#wordCount(paper, "mothur")







#wordPlacement: filelist, word to vector of numbers.
#if I supply the output from readPaper and a word, tell me the starting character position of that word indexed from the beginning of the paper
#wordPlacement(paper, "mothur")







#wordHist: filelist,nwords=10 to histogram output and plot.
#Generate a histogram of how many times the top 10 words are used, but allow me to change the default number of "top words"
#wordHist(paper, top=20)








#nextWord: filelist, word to vector of counts.
#if I give a word, tell me the frequency of words that follow it
#nextWord(paper, "mothur")








#previousWord: filelist, word to vector of counts.
#if I give a word, tell me the frequency of words that preceed it
#previousWord(paper, "mothur")










#surpriseMe: filelist,??? to ????.
#create a function "surpriseMe" that does a task of your choosing
#surpriseMe(paper, ...)
