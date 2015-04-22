library(rvest)
library(dplyr)

url <- "http://www.r-bloggers.com/search/web%20scraping/"
urls <- "http://www.r-bloggers.com/search/web%20scraping/page/"

titles <- url %>%
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
