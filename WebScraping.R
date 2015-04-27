library(rvest)
library(dplyr)

url <- "http://www.r-bloggers.com/search/web%20scraping/"
urls <- "http://www.r-bloggers.com/search/web%20scraping/page/"
page = 17

selector1 <- "#leftcontent h2"
selector2 <- ".date"
selector3 <- ".meta a"

extract <- function(url, selector1, selector2, selector3){

  data1 <- url %>%
    html() %>%
    html_nodes(selector1) %>%
    html_text()
  
  data2 <- url %>%
    html() %>%
    html_nodes(selector2) %>%
    html_text()
  
  data3 <- url %>%
    html() %>%
    html_nodes(selector3) %>%
    html_text()
  
  data1.df <- as.data.frame(data1, stringsAsFactors=FALSE)
  data2.df <- as.data.frame(data2, stringsAsFactors=FALSE)
  data3.df <- as.data.frame(data3, stringsAsFactors=FALSE)
  
  df <- bind_cols(data1.df, data2.df, data3.df)
  return(df)
}

df_all <- extract(url, selector1, selector2, selector3)

for(i in 2:page) {
  urlreq <- paste0(urls,i)
  df <- extract(urlreq, selector1, selector2, selector3)
  Sys.sleep(1)
  print(urlreq)
  df_all <- rbind(df_all, df)
}

View(df_all)
