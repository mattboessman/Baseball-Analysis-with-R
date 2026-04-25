library (readxl)
library (openxlsx)

#assign teams in datasheet based on respective numbers used in website url

MLBBATLOGSWTEAM <- read_excel("MLBBATLOGSWTEAM.xlsx")
MLBPITCHLOGSWTEAM <- read_excel("MLBPITCHLOGSWTEAM.xlsx")

MLBBATLOGSWTEAM$team <- dplyr:: recode(MLBBATLOGSWTEAM$team, 
                                       "1" = "Los Angeles Angels",
                                       "2" = "Baltimore Orioles",
                                       "3" = "Boston Red Sox",
                                       "4" = "Chicago White Sox",
                                       "5" = "Cleveland Guardians",
                                       "6" = "Detroit Tigers",
                                       "7" = "Kansas City Royals",
                                       "8" = "Minnesota Twins",
                                       "9" = "New York Yankees",
                                       "10" = "Athletics",
                                       "11" = "Seattle Mariners",
                                       "12" = "Tampa Bay Rays",
                                       "13" = "Texas Rangers",
                                       "14" = "Toronto Blue Jays",
                                       "15" = "Arizona Diamondbacks",
                                       "16" = "Atlanta Braves",
                                       "17" = "Chicago CUbs",
                                       "18" = "Cincinnati Reds",
                                       "19" = "Colorado Rockies",
                                       "20" = "Miami Marlins",
                                       "21" = "Houston Astros",
                                       "22" = "Los Angeles Dodgers",
                                       "23" = "Milwaukee Brewers",
                                       "24" = "Washington Nationals",
                                       "25" = "New York Mets",
                                       "26" = "Philadelphia Phillies",
                                       "27" = "Pittsburgh Pirates",
                                       "28" = "St. Louis Cardinals",
                                       "29" = "San Diego Padres",
                                       "30" = "San Francisco Giants" )
MLBPITCHLOGSWTEAM$team <- dplyr:: recode(MLBPITCHLOGSWTEAM$team, 
                                       "1" = "Los Angeles Angels",
                                       "2" = "Baltimore Orioles",
                                       "3" = "Boston Red Sox",
                                       "4" = "Chicago White Sox",
                                       "5" = "Cleveland Guardians",
                                       "6" = "Detroit Tigers",
                                       "7" = "Kansas City Royals",
                                       "8" = "Minnesota Twins",
                                       "9" = "New York Yankees",
                                       "10" = "Athletics",
                                       "11" = "Seattle Mariners",
                                       "12" = "Tampa Bay Rays",
                                       "13" = "Texas Rangers",
                                       "14" = "Toronto Blue Jays",
                                       "15" = "Arizona Diamondbacks",
                                       "16" = "Atlanta Braves",
                                       "17" = "Chicago CUbs",
                                       "18" = "Cincinnati Reds",
                                       "19" = "Colorado Rockies",
                                       "20" = "Miami Marlins",
                                       "21" = "Houston Astros",
                                       "22" = "Los Angeles Dodgers",
                                       "23" = "Milwaukee Brewers",
                                       "24" = "Washington Nationals",
                                       "25" = "New York Mets",
                                       "26" = "Philadelphia Phillies",
                                       "27" = "Pittsburgh Pirates",
                                       "28" = "St. Louis Cardinals",
                                       "29" = "San Diego Padres",
                                       "30" = "San Francisco Giants" )
                                       
 write.xlsx(MLBBATLOGSWTEAM, "MLBBATLOGSWTEAM2.xlsx") 
 write.xlsx(MLBPITCHLOGSWTEAM, "MLBPITCHLOGSWTEAM2.xlsx")
                                       
                                       
                                       
                                       