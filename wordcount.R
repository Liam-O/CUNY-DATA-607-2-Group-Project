con1 <- file("Week_7/scraped_data/scraped_samp.txt", "r")
scraped_postings <- readLines(con1) 
close(con1)



library(rJava)
library(RWeka)

library(tm)
library(SnowballC)
samp = Corpus(DirSource("Week_7/scraped_data"), 
              readerControl = list(language = "en_EN", load = F))

# Make lowercase & remove punctuation
samp_clean = tm_map(samp, tolower)

# Remove special characters and punctuation (code may have to be adjusted
# depending on the input structure)

for(j in seq(samp_clean))   
{   
  samp_clean[[j]] = iconv(samp_clean[[j]], to="ASCII", sub = "") 
  samp_clean[[j]] <- gsub("/", " ", samp_clean[[j]])   
  samp_clean[[j]] <- gsub("@", " ", samp_clean[[j]])   
  samp_clean[[j]] <- gsub("\\|", " ", samp_clean[[j]])
}  
samp_clean = tm_map(samp_clean, PlainTextDocument)  
samp_clean = tm_map(samp_clean, removePunctuation)

# Remove stopwords
samp_clean = tm_map(samp_clean, removeWords, stopwords("english")) 

# Strip white space
#samp_clean = tm_map(samp_clean, stemDocument) # do not stem for now
samp_clean = tm_map(samp_clean, stripWhitespace) 

# Tokenize 1 to 4-grams
xgramTokenizer = function(x) NGramTokenizer(x, Weka_control(min = 1, max = 4))

# Calculate ngram freqs
tdmatrix = TermDocumentMatrix(samp_clean, control = list(tokenize = xgramTokenizer))

# ngram probabilities
library(reshape2)

m2 = as.matrix(tdmatrix)
m2.df = data.frame(m2)
m2.df$keywords = rownames(m2.df)
m2.df.melted = melt(m2.df)
colnames(m2.df.melted) = c("Keyword","Source","Freq")


require(wordcloud)
wordcloud(samp_clean, max.words = 100, random.order = F, rot.per=0.0, colors=brewer.pal(3,"Dark2" ))
