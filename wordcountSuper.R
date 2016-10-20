#source('wordcount.R')
if (!require('stringr')) install.packages('stringr')
if (!require('dplyr')) install.packages('dplyr')
if (!require('tidyr')) install.packages('tidyr')

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

#read in supervised skill set:
sup.skills<-read.csv('skills_lists.csv',stringsAsFactors = FALSE)
names(sup.skills)<-'skill.name'

# init clean
raw <- str_replace_all(raw,"[^[:graph:]]", " ") 
raw <- tolower(raw)

## quick convert r, c++, c
sup.skills$skill.name[sup.skills$skill.name == "r"] <- "_r_"
sup.skills$skill.name[sup.skills$skill.name == "c++"] <- "_cpp_"
sup.skills$skill.name[sup.skills$skill.name == "c"] <- "_c_"

# apply search function to list of skills, create append results to raw
skill.freq<-sapply(sup.skills$skill.name,search,df=raw)
# convert to df for easier analysis
skill.freq.df<-as.data.frame(cbind(names(skill.freq),skill.freq),stringsAsFactors = FALSE, make.row.name=FALSE)

# order df 
skill.freq.df %>%
  mutate(skill.freq=as.numeric(skill.freq)) %>%
  arrange(desc(skill.freq)) 

names(skill.freq.df) <- c("Keyword", "Freq")
row.names(skill.freq.df) <- c()

# convert back
skill.freq.df$Keyword[skill.freq.df$Keyword == "_r_"] <- "r"
skill.freq.df$Keyword[skill.freq.df$Keyword == "_cpp_"] <- "c++"
skill.freq.df$Keyword[skill.freq.df$Keyword == "_c_"] <- "c"

# export csv
write.csv(skill.freq.df, "wordcountSuper.csv", row.names=FALSE)
