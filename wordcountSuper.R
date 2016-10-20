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
raw <- scan('ScrapeOutput/scrapeOutput.txt', what="character", encoding='UTF-8', sep='\n')

#read in supervised skill set:
sup.skills<-read.csv('/skills_lists.csv',stringsAsFactors = FALSE)
names(sup.skills)<-'skill.name'

# init clean
raw <- str_replace_all(raw,"[^[:graph:]]", " ") 
raw <- tolower(raw)

# need function to a) pull skills from db, b) make lowercase, 
# c) put into a single vector called 'skills'
skills <- sup.skills

### search and create df
mlist <- list()

for (i in 1:length(skills)) {
    skill <- skills[i]
    count <- search(skill, raw)
    mlist[[i]] <- c(skill, count)
}

######### above loop did not work for me - going with sapply #############
skill.freq<-sapply(sup.skills$skill.name,search,df=raw)
# convert to df for easier analysis
skill.freq.df<-as.data.frame(cbind(names(skill.freq),skill.freq),stringsAsFactors = FALSE, make.row.name=FALSE)

#reveals that skills 'r', 'c' and 'c++' need to be addressed 
skill.freq.df %>%
  mutate(skill.freq=as.numeric(skill.freq)) %>%
  arrange(desc(skill.freq)) %>%
  head()

#need to put spaces around the skills-from-DB vector... use that as a search

#########  end of my rewrite  #############

df <- do.call(rbind, mlist)
colnames(df) <- c('Keyword', 'Freq')

write.csv(df, "wordcountSuper.csv", row.names=FALSE)
