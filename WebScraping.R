#Note:
#Try to create function that can take a list of selectors
#Enforce each selector in the list returns the same number of results
#For each selector, eventually create a DF with each selector resulting
#in a column in the resulting datafame



library(rvest)
library(dplyr)

url <- "http://www.r-bloggers.com/search/web%20scraping/"
urls <- "http://www.r-bloggers.com/search/web%20scraping/page/2"

#Function to pull data from a selector
fromSelector <-  function(url, selector) {
  extract <- url %>%
    html() %>%
    html_nodes(selector) %>%
    html_text()
  
  return (extract)
}


titles <- urls %>%
  html() %>%
  html_nodes("#leftcontent h2") %>%
  html_text()

date <- url %>%
  html() %>%
  html_nodes(".date") %>%
  html_text()

author <- url %>%
  html() %>%
  html_nodes(".meta") %>%
  html_text()

str(titles)
str(author)
View(titles)
View(author)

titles.df <- as.data.frame(titles)
date.df <- as.data.frame(date)

data <- bind_cols(titles.df, date.df)

View(data)









titles <- fromSelector(url, "#leftcontent h2")
str(titles)


extract <- function(url, selector1, selector2{

  data1 <- url %>%
    html() %>%
    html_nodes(selector1) %>%
    html_text()
  
  data2 <- url %>%
    html() %>%
    html_nodes(selector2) %>%
    html_text()
  
  data1.df <- as.data.frame(data1)
  data2.df <- as.data.frame(data2)
  
  df <- bind_cols(data1.df, data2.df)
  
  return(df)
}

test <- updateURL(urls, 3)
