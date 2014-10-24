# Assignment 4
Patrick D. Schloss  
October 24, 2014  

Complete the exercise listed below and submit it as a pull request to the
[Assignment 4
repository](http://www.github.com/microbialinformatics/assignment04). Your pull
request should only include a single file that is your unique name followed by a
`.R`. For example, I would submit a pull request to add `pschloss.R` to the
repository. You will submit your own assignment and give credit to anyone that
worked with you on the assignment and to any websites that you used along your
way. You should not use any packages beyond the base R system. This assignment
is due on Friday, October 31st.

---

**Problem:**  Reading the literature is very time consuming and there's never
enough time.  Develop a set of functions that you can use to help you to
determine the priority each should have in your stack of papers.  To do this you
will identify and count all of the words in the paper.  I would like you to
develop a new R library (a collection of R functions) that has several basic
commands:

Command | Input | Output | Functionality
--------|-------|-----|----------------
`readPaper` | `file` | a list | given a file name, create a list variable that contains any necessary information
`wordCount` | `filelist`, `word` | vector of numbers | if I supply the output from readPaper and a word (or a vector of words), tell me how many times the word(s) shows up
`wordPlacement` | `filelist`, `word` | vector of numbers | if I supply the output from readPaper and a word, tell me the starting character position of that word indexed from the beginning of the paper
`wordHist` | `filelist`, `nwords=10`| histogram output and plot | Generate a histogram of how many times the top 10 words are used, but allow me to change the default number of "top words"
`nextWord` | `filelist`, `word` | vector of counts | if I give a word, tell me the frequency of words that follow it
`previousWord` | `filelist`, `word` | vector of counts | if I give a word, tell me the frequency of words that preceed it
`surpriseMe` | `filelist`, ??? | ??? |create a function "surpriseMe" that does a task of your choosing

This file should contain all the code necessary to process a single text file.
You should know enough to complete this assignment with the material covered in
class and from the first four chapaters of the book.  One command that you will
need for your read command is "scan". I should be able to run these command on
another text file without touching the code in your R file. The first line of
code should be:

    rm(list=ls())

In addition, the R file should contain a commented block of text at the top of
each function telling anyone how to run each commands. Also, the code should be
well commented so that it is clear what each step does. I will test your code by
running the following commands:  

```
source("XXXXXXXX.R")
paper <- readPaper("mothur.txt")	#I may use a different file
wordCount(paper, "mothur")			#I may use a different word
wordPlacement(paper, "mothur")		#I may use a different word
wordHist(paper)
wordHist(paper, top=20)
nextWord(paper, "mothur")			#I may use a different word
previousWord(paper, "mothur")		#I may use a different word
surpriseMe(paper, ...)
```

***Note:*** You may find it necessary to create extra functions that perform a
task that is needed by multiple commands. This is fine - such utility functions
do not need to be "seen" by the users.
