library (readxl)
library (openxlsx)
library (dplyr)



UpdatedMasterAwayBatters <- read_excel("MLBStuff/UpdatedMasterAwayBatters.xlsx")
UpdatedMasterHomeBatters <- read_excel("MLBStuff/UpdatedMasterHomeBatters.xlsx")

#removes pitcher names and combines pitcher stats to get complete team stats from pitchers used in a specifc game

ABatresult <- UpdatedMasterAwayBatters |>
  group_by(month, day, Away) |>
  
  summarise(
    meanInnPit = mean(sumInnPit, na.rm=TRUE),
    meanHits = mean(sumHits, na.rm=TRUE),
    meanER = mean(sumER, na.rm=TRUE),
    meanHR = mean(sumHR, na.rm=TRUE),
    meanBB = mean(sumBB, na.rm=TRUE),
    meank = mean(sumk, na.rm=TRUE),
    meanHBP = mean(sumHBP, na.rm=TRUE),
    meanWHIP= mean(WHIP, na.rm=TRUE),
    meanHitsper9 = mean(HitsPer9, na.rm=TRUE),
    meanERA = mean(ERA, na.rm=TRUE),
    meanHRPer9 = mean(HRPer9, na.rm=TRUE),
    meanBBPer9 = mean(BBPer9, na.rm=TRUE),
    meanKper9 = mean(KPer9, na.rm=TRUE),
    meanAwayScore = mean(AwayScore, na.rm=TRUE),
    meanHomeScore = mean(HomeScore, na.rm=TRUE),
    
    
    sumHits= sum(Hits, na.rm=TRUE),
    sumHR= sum(HR, na.rm =TRUE),
    sumRBI= sum(RBI, na.rm=TRUE),
    sumBB= sum(BB, na.rm=TRUE),
    sumk= sum(K, na.rm=TRUE),
    sumSB= sum(SB, na.rm=TRUE),
    sumCS= sum(CS, na.rm=TRUE),
    sumSacHit= sum(SacHit, na.rm=TRUE),
    sumSacFly= sum(SacFly, na.rm=TRUE),
    sumGIDP= sum(GIDP, na.rm=TRUE),
    meanBASeason= mean(BASeason, na.rm=TRUE),
    meanOBPSeason= mean(OBPSeason, na.rm=TRUE),
    
    meanSlugSeason = mean(SlugSeason, na.rm=TRUE),
    meanPctGWH= mean(PctGWH, na.rm=TRUE),
    meanRunsPerGame= mean(RunsPerGame, na.rm=TRUE),
    meanHitsPerGame= mean(HitsPerGame, na.rm =TRUE),
    meanDoublePerGame= mean(DoublePerGame, na.rm=TRUE),
    meanTriplePerGame= mean(TriplePerGame, na.rm=TRUE),
    meanHRPerGame= mean(HRPerGame, na.rm=TRUE),
    meanRBIPerGame= mean(RBIPerGame, na.rm=TRUE),
    meanWalksPerGame= mean(WalksPerGame, na.rm=TRUE),
    meanIBBPerGame= mean(IBBPerGame, na.rm=TRUE),
    meanHBPPerGame= mean(HBPPerGame, na.rm=TRUE),
    meanKPerGame= mean(KPerGame, na.rm=TRUE),
    meanSBPerGame= mean(SBPerGame, na.rm=TRUE),
    meanCSPerGame= mean(CSPerGame, na.rm=TRUE),
    meanSHPerGame= mean(SHPerGame, na.rm=TRUE),
    meanSFPerGame= mean(SFPerGame, na.rm=TRUE),
    meanGDPPerGame= mean(GDPPerGame, na.rm=TRUE)
    
    
  )
HBatresult <- UpdatedMasterHomeBatters |>
  group_by(month, day, Home) |>
  
  summarise(
    meanInnPit = mean(sumInnPit, na.rm=TRUE),
    meanHits = mean(sumHits, na.rm=TRUE),
    meanER = mean(sumER, na.rm=TRUE),
    meanHR = mean(sumHR, na.rm=TRUE),
    meanBB = mean(sumBB, na.rm=TRUE),
    meank = mean(sumk, na.rm=TRUE),
    meanHBP = mean(sumHBP, na.rm=TRUE),
    meanWHIP= mean(WHIP, na.rm=TRUE),
    meanHitsper9 = mean(HitsPer9, na.rm=TRUE),
    meanERA = mean(ERA, na.rm=TRUE),
    meanHRPer9 = mean(HRPer9, na.rm=TRUE),
    meanBBPer9 = mean(BBPer9, na.rm=TRUE),
    meanKper9 = mean(KPer9, na.rm=TRUE),
    meanAwayScore = mean(AwayScore, na.rm=TRUE),
    meanHomeScore = mean(HomeScore, na.rm=TRUE),
    
    
    sumHits= sum(Hits, na.rm=TRUE),
    sumHR= sum(HR, na.rm =TRUE),
    sumRBI= sum(RBI, na.rm=TRUE),
    sumBB= sum(BB, na.rm=TRUE),
    sumk= sum(K, na.rm=TRUE),
    sumSB= sum(SB, na.rm=TRUE),
    sumCS= sum(CS, na.rm=TRUE),
    sumSacHit= sum(SacHit, na.rm=TRUE),
    sumSacFly= sum(SacFly, na.rm=TRUE),
    sumGIDP= sum(GIDP, na.rm=TRUE),
    meanBASeason= mean(BASeason, na.rm=TRUE),
    meanOBPSeason= mean(OBPSeason, na.rm=TRUE),
    
    meanSlugSeason = mean(SlugSeason, na.rm=TRUE),
    meanPctGWH= mean(PctGWH, na.rm=TRUE),
    meanRunsPerGame= mean(RunsPerGame, na.rm=TRUE),
    meanHitsPerGame= mean(HitsPerGame, na.rm =TRUE),
    meanDoublePerGame= mean(DoublePerGame, na.rm=TRUE),
    meanTriplePerGame= mean(TriplePerGame, na.rm=TRUE),
    meanHRPerGame= mean(HRPerGame, na.rm=TRUE),
    meanRBIPerGame= mean(RBIPerGame, na.rm=TRUE),
    meanWalksPerGame= mean(WalksPerGame, na.rm=TRUE),
    meanIBBPerGame= mean(IBBPerGame, na.rm=TRUE),
    meanHBPPerGame= mean(HBPPerGame, na.rm=TRUE),
    meanKPerGame= mean(KPerGame, na.rm=TRUE),
    meanSBPerGame= mean(SBPerGame, na.rm=TRUE),
    meanCSPerGame= mean(CSPerGame, na.rm=TRUE),
    meanSHPerGame= mean(SHPerGame, na.rm=TRUE),
    meanSFPerGame= mean(SFPerGame, na.rm=TRUE),
    meanGDPPerGame= mean(GDPPerGame, na.rm=TRUE)
  )



write.xlsx(HBatresult, "HomeForRegression.xlsx", overwrite=TRUE)
