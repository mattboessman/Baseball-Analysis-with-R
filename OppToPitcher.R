library (readxl)
library (openxlsx)
library (dplyr)

#assigns game scores to pitching data

oppmerge <- read_xlsx("FinalTeamPitAverages.xlsx")
scorereference <- read_xlsx("DailyScores.xlsx")


oppmerge <- oppmerge |>
  mutate(
    team = as.character(team),
    month = as.character(month),
    day = as.character(day)
  )

scorereference <- scorereference |>
  
  mutate(
  team = as.character(team),
   month = as.character(month),
  day = as.character(day)
)


oppresult <- 
  left_join(oppmerge, scorereference, by = c("team", "month", "day")) 


write_xlsx(oppresult, "PitchersAndScores.xlsx")


