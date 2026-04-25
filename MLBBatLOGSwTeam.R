library(rvest)
library(dplyr)
library(writexl)

#imports daily performance data

baseurl <- "https://www.baseballmusings.com/cgi-bin/CompareInfo.py?StartDate=05%2F01%2F2025&EndDate=05%2F01%2F2025&GameType=all&PlayedFor=0&PlayedVs=0&Park=0&SortField=AtBats&SortDir=desc&MinPA=1&MinG=0&MinGS=0&MinAB=0&MinR=0&MinH=0&MinDB=0&MinTP=0&MinHR=0&MinRBI=0&MinBB=0&MinIBB=0&MinHP=0&MinK=0&MinSB=0&MinCS=0&MinSH=0&MinSF=0&MinGDP=0&MinCI=0"
all_data <- list(df)
#shows how many characters are in the url
idx <- 1

nchar("https://www.baseballmusings.com/cgi-bin/CompareInfo.py?StartDate=05%2F01%2F2025&EndDate=05%2F01%2F2025&GameType=all&PlayedFor=0&PlayedVs=0&Park=0&SortField=AtBats&SortDir=desc&MinPA=1&MinG=0&MinGS=0&MinAB=0&MinR=0&MinH=0&MinDB=0&MinTP=0&MinHR=0&MinRBI=0&MinBB=0&MinIBB=0&MinHP=0&MinK=0&MinSB=0&MinCS=0&MinSH=0&MinSF=0&MinGDP=0&MinCI=0")

#changes month in url

for (m in 5:8){
  
  monthstring <- sprintf("%01d", m)
  
  #changes date in the base url and reprints
  
  for (d in 01:30) {
    daystring <- sprintf("%01d", d )
    
    for (t in 01:30) {
      teamstring <- sprintf("%01d&", t)
      
      
      part1 <- substr(baseurl, 1, 66)
      part2 <- substr(baseurl, 68, 70)
      part3 <- substr(baseurl, 73, 89)
      part4 <- substr(baseurl, 91, 93)
      part5 <- substr(baseurl, 96, 126)
      part6 <- substr(baseurl, 129, 334)
      
      
      finalurl <- paste0(part1, monthstring, part2, daystring, part3, monthstring, part4, daystring, part5, teamstring, part6)
      
      cat("url: ", finalurl, "\n")
      
      page <- read_html(finalurl)
      
      tables <- page   |>
        html_table(fill= TRUE)
      
      df <- tables[[3]]
      
      #adds column so I know what url the table came from
      
      df$month <- paste(m)
      df$day <- paste(d)
      df$team <- paste(t)
      
      all_data[[idx]]<- df
      
      idx <- idx + 1
    }
  }
  all_data <- lapply(all_data, function(x)
  {x[] <- lapply(x, as.character)})
  
}

print(finalurl)

final_data <-bind_rows(all_data)

write_xlsx(final_data, "MLBBATLOGSWTEAM.xlsx")
