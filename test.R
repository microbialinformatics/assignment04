f <- list.files(pattern="*.R$")
source(f)

words <- readPaper("mothur.txt")
wordCount(words, "mothur")
wordPlacement(words, "mothur")
wordHist(words)
nextWord(words, "mothur")
previousWord(words, "mothur")
wordCount(words, "revolution")
wordPlacement(words, "revolution")
nextWord(words, "revolution")
previousWord(words, "revolution")
wordCount(words, c("the", "revolution", "mothur"))
