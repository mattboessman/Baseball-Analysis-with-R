library(rvest)
library(dplyr)
library(writexl)

baseurl <- "https://www.baseballmusings.com/cgi-bin/CompareInfo.py?StartDate=04%2F01%2F2025&EndDate=05%2F01%2F2025&GameType=away&PlayedFor=0&PlayedVs=0&Park=0&SortField=AtBats&SortDir=desc&MinPA=0&MinG=0&MinGS=0&MinAB=0&MinR=0&MinH=0&MinDB=0&MinTP=0&MinHR=0&MinRBI=0&MinBB=0&MinIBB=0&MinHP=0&MinK=0&MinSB=0&MinCS=0&MinSH=0&MinSF=0&MinGDP=0&MinCI=0"
homeall_data <- list(df)
idx <- 1

#shows how many characters are in the url

nchar("https://www.baseballmusings.com/cgi-bin/CompareInfo.py?StartDate=04%2F01%2F2025&EndDate=05%2F01%2F2025&GameType=away&PlayedFor=0&PlayedVs=0&Park=0&SortField=AtBats&SortDir=desc&MinPA=0&MinG=0&MinGS=0&MinAB=0&MinR=0&MinH=0&MinDB=0&MinTP=0&MinHR=0&MinRBI=0&MinBB=0&MinIBB=0&MinHP=0&MinK=0&MinSB=0&MinCS=0&MinSH=0&MinSF=0&MinGDP=0&MinCI=0")

#changes month in url

for (m in 5:8){
  
  monthstring <- sprintf("%01d", m)
  
  #changes date in the base url and reprints
  
  for (d in 01:30) {
    daystring <- sprintf("%01d", d )
    
    
    part1 <- substr(baseurl, 1, 89)
    part2 <- substr(baseurl, 91, 93)
    part3 <- substr(baseurl, 96, 335)
    
    
    
    finalurl <- paste0(part1, monthstring, part2, daystring, part3)
    
    cat("url: ", finalurl, "\n")
    
    page <- read_html(finalurl)
    
    tables <- page   |>
      html_table(fill= TRUE)
    
    df <- tables[[3]]
    
    #adds column so I know what url the table came from
    
    df$month <- paste(m)
    df$day <- paste(d)
    
    homeall_data[[idx]]<- df
    
    idx <- idx + 1
  }
  
  awayall_data <- lapply(homeall_data, function(x)
  {x[] <- lapply(x, as.character)})
  
}

print(finalurl)

awaybatfinal_data <-bind_rows(homeall_data)

write_xlsx(awaybatfinal_data, "awaybatfinaldata.xlsx")


