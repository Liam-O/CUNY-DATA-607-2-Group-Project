library(RCurl)
library(XML)
library(rvest)
library(knitr)
library(dplyr)
library(stringr)
library("httr") # for adding user-agent to header

#parse the URL

theURL <- "http://www.indeed.com/jobs?q=%22data+scientist%22&l=san+francisco"

linksdf <- data.frame(JobLinks=character(), stringsAsFactors=FALSE)

scrape_indeed_links <- function(page_data){

    jobLinks <- page_data %>%
        html_nodes(xpath='//*[contains(concat( " ", @class, " " ), concat( " ", "jobtitle", " " ))]//*[contains(concat( " ", @class, " " ), concat( " ", "turnstileLink", " " ))]
                   ') %>%
        html_attr("href")

    #is.character(jobLinks)
    #length(jobLinks)

    # looping to get links from all the pages of search result.
    for (i in c(1:length(jobLinks))){
        jobLinks[i] <- paste("http://www.indeed.com", jobLinks[i], sep = "")
    }
    # create a dataframe with all the links from a page
    linksdf <- data.frame(JobLinks=jobLinks, stringsAsFactors=FALSE)
    return(linksdf)
}


#get the total number of pages

pages<- read_html(theURL) %>%
    html_nodes(xpath='//*[(@id = "searchCount")]') %>%
    html_text()

# regex to convert it into numbers
results <- str_extract(pages,"of \\d+")
results <- as.numeric(str_extract(results,"\\d+"))

# need this conversion for indeed website and how they name the page numbers.
page_no = results/10;
page_no = floor(page_no) #number of pages
page_no_url = page_no*10 #for URL string

# Loop through all the pages to get the job postings URL:
#output <- vector(mode="character", length=page_no)
for (i in c(1:page_no)){
    Sys.sleep(1)
    page_no_url = (i-1)*10
    pageURL <- paste(theURL,"&start=",page_no_url, sep="")
    page_data <- read_html(pageURL)
    linksdf<-rbind(linksdf,scrape_indeed_links(page_data))
}


text <- list()

# Extracts list\bullet text from all urls -> A lot less clean-up and the content is more promising.
# Pages that are not bulleted\listed are oddly formated or of a lower quality than most pages I browsed through.

# runtime ~ 3-5 min. Errors may pop-up, but 'try' keeps it going.
for (i in 1:nrow(linksdf)) {
    #Sys.sleep(1)
    try(
        text[[i]] <- read_html(GET(linksdf$JobLinks[i], add_headers('user-agent' = 'r'))) %>%
            html_nodes(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "bulleted", " " ))]|//ul') %>%
            html_text(trim = TRUE)
    )
}

# ***--- To Do ---***
# Clean 'text' lists, possibly perform a split on '\n' or other -> Talk to Dmitriy or Walt
# Other list type objects, e,g, 'ul' -> use those as well?
# Talk to @Slack#WordCount to finalize what type of output object they want
# ...