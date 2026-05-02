library (readxl)
library (openxlsx)
library (dplyr)

#puts year to date stats side by side with game logs

mainbat <- read_xlsx("MLBBATLOGSWTEAM2.xlsx")
homebatreference <- read_xlsx("Homebatfinaldata.xlsx")
awaybatreference <- read_xlsx("awaybatfinaldata.xlsx")

batresult <- mainbat |>
  left_join(homebatreference, by = c("Player", "month", "day")) |>
  left_join(awaybatreference, by = c("Player", "month", "day"))

View(batresult)

write.xlsx(batresult, "BatResultwCurrentStats.xlsx")
