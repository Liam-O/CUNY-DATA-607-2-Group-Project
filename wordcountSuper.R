#source('wordcount.R')
if (!require('stringr')) install.packages('stringr')

# let's directly map our required list.   if wordcount.R gets us our 
# frequency counts in an unsupervised way, wordcountSuper.R basically just
# looks for the terms we're expecting in a supervised way.  

# function to search
search <- function(term, df) {
    sum(str_count(df, term))
}

# read in raw
#raw <- scan('ScrapeOutput/scrapeOutput.txt', what="character", encoding='UTF-8', sep='\n')
raw <- readLines('ScrapeOutput/scrapeOutput.txt', encoding = "ASCII")

# init clean
raw <- str_replace_all(raw,"[^[:graph:]]", " ") 
raw <- tolower(raw)

# need function to a) pull skills from db, b) make lowercase, 
# c) put into a single vector called 'skills'
skills <- c('java', 'r', 'scala', 'python', 'c', 'c++', 'sas', 'natural language processing')

### search and create df
mlist <- list()

for (i in 1:length(skills)) {
    skill <- skills[i]
    count <- search(skill, raw)
    mlist[[i]] <- c(skill, count)
}

df <- do.call(rbind, mlist)
colnames(df) <- c('Keyword', 'Freq')

write.csv(df, "wordcountSuper.csv", row.names=FALSE)
