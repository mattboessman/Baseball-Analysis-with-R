library (readxl)
library (openxlsx)
library (dplyr)

library(readxl)
PitchEdit <- read_excel("~/PitchTest.xlsx")

#removes pitcher names and combines pitcher stats to get complete team stats from pitchers used in a specifc game

result <- PitchEdit |>
  group_by(month, day, team) |>
  summarise(
    sumInnPit = sum(IP, na.rm=TRUE),
    sumHits = sum(H, na.rm=TRUE),
    sumER = sum(ER, na.rm=TRUE),
    sumHR = sum(HR, na.rm=TRUE),
    sumBB = sum(BB, na.rm=TRUE),
    sumk = sum(K, na.rm=TRUE),
    sumHBP = sum(HBP, na.rm=TRUE),
    Cy= sum(CyYoungPts, na.rm=TRUE)
    ) |>
      
     mutate(
       
      WHIP= (sumHits + sumBB+ sumHBP)/ sumInnPit,
      HitsPer9= (sumHits/sumInnPit),
      ERA= (sumER/sumInnPit),
      HRPer9= (sumHR/sumInnPit),
      BBPer9= (sumBB/sumInnPit),
      KPer9= (sumk/sumInnPit)
      
     )

write.xlsx(result, "FinalTeamPitAverages.xlsx")
