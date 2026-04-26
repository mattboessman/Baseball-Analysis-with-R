library (readxl)
library (openxlsx)
library (dplyr)

PS <- read_xlsx("PitchersAndScores2.xlsx")
Bat <- read_xlsx("BatResultwCurrentStats.xlsx")

 
finallresult <- PS |>
  left_join(Bat, by = c("Away", "month", "day"))

write.xlsx(finallresult, "MasterDataAwayBatters.xlsx")

