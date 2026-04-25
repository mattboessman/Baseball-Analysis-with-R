library (readxl)
library (openxlsx)
library (dplyr)

#puts year to date stats side by side with game logs

mainpit <- read_xlsx("MLBPITCHLOGSWTEAM2.xlsx")
homepitreference <- read_xlsx("Homepitchfinaldata.xlsx")
awaypitreference <- read_xlsx("awaypitfinaldata.xlsx")

pitresult <- mainpit |>
  left_join(homepitreference, by = c("Player", "month", "day")) |>
  left_join(awaypitreference, by = c("Player", "month", "day"))

View(pitresult)

write.xlsx(pitresult, "PitResultwCurrentStats.xlsx")
