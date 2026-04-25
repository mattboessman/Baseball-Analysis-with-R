library(rvest)
library(dplyr)
library(writexl)

#imports year to date stats on a given date

baseurl <- "https://www.baseballmusings.com/cgi-bin/ComparePitchers.py?StartDate=05%2F01%2F2025&EndDate=05%2F01%2F2025&GameType=home&PlayedFor=0&PlayedVs=0&Park=0&SortField=Balks&SortDir=desc&MinPA=0&MinDEC=0&MinG=0&MinGS=0&MinCG=0&MinGF=0&MinW=0&MinL=0&MinSV=0&MinSHO=0&MinH=0&MinR=0&MinER=0&MinHR=0&MinBB=0&MinK=0&MinHP=0&MinBK=0&MinWP=0"
homepitall_data <- list(df)
idx <- 1

#shows how many characters are in the url

nchar("https://www.baseballmusings.com/cgi-bin/ComparePitchers.py?StartDate=05%2F01%2F2025&EndDate=05%2F01%2F2025&GameType=home&PlayedFor=0&PlayedVs=0&Park=0&SortField=Balks&SortDir=desc&MinPA=0&MinDEC=0&MinG=0&MinGS=0&MinCG=0&MinGF=0&MinW=0&MinL=0&MinSV=0&MinSHO=0&MinH=0&MinR=0&MinER=0&MinHR=0&MinBB=0&MinK=0&MinHP=0&MinBK=0&MinWP=0")

#changes month in url

for (m in 5:8){
  
  monthstring <- sprintf("%01d", m)
  
  #changes date in the base url and reprints
  
  for (d in 01:30) {
    daystring <- sprintf("%01d", d )
    
    
    part1 <- substr(baseurl, 1, 93)
    part2 <- substr(baseurl, 95, 97)
    part3 <- substr(baseurl, 100, 335)
    
    finalurl <- paste0(part1, monthstring, part2, daystring, part3)
    
    cat("url: ", finalurl, "\n")
    
    page <- read_html(finalurl)
    
    tables <- page   |>
      html_table(fill= TRUE)
    
    df <- tables[[3]]
    
    #adds column so I know what url the table came from
    
    df$month <- paste(m)
    df$day <- paste(d)
    
    homepitall_data[[idx]]<- df
    
    idx <- idx + 1
  }
  
  homepitall_data <- lapply(homepitall_data, function(x)
  {x[] <- lapply(x, as.character)})
  
}

print(finalurl)

homepitfinal_data <-bind_rows(homepitall_data)

write_xlsx(homepitfinal_data, "homepitchfinaldata.xlsx")
