library (readxl)
library (openxlsx)
library (dplyr)

PS4 <- read_xlsx("PitchersAndScores4.xlsx")
Bat <- read_xlsx("BatResultwCurrentStats.xlsx")
Opp <- read_xlsx("DailyScores2.xlsx")


Home <- Bat |>
  left_join(PS4, by = c("home", "month", "day"))

CleanHome <- Home |> distinct()

View(CleanHome)

write.xlsx(CleanHome, "MasterDataHomeBat3.xlsx")

