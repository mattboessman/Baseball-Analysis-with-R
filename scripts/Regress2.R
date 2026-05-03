library (readxl)
library (openxlsx)
library (dplyr)

ABat <- read_xlsx("MLBStuff/AwayForRegression.xlsx")
HBat <- read_xlsx("MLBStuff/HomeForRegression.xlsx")

AwayScoreRegress <- lm(meanAwayScore ~ sumHits + sumHR  + sumRBI + sumBB + sumk + sumSB + sumCS + sumSacHit + sumSacFly + sumGIDP, 
                       data = ABat)

AwayScoreRegress1 <- lm(meanAwayScore ~ sumRBI + sumk + sumGIDP, 
                       data = ABat)

summary(AwayScoreRegress1)


AwayRegress <- lm(sumGIDP ~ meanWHIP + meanHitsper9 + meanERA + meanHRPer9 + meanBBPer9 + meanKper9 + meanBASeason
                  + meanOBPSeason + meanSlugSeason + meanPctGWH + meanRunsPerGame + meanHitsPerGame + meanDoublePerGame + 
                  meanTriplePerGame + meanHRPerGame + meanRBIPerGame + meanWalksPerGame + meanIBBPerGame + meanHBPPerGame +
                  meanKPerGame + meanSBPerGame + meanCSPerGame + meanSHPerGame + meanSFPerGame + meanGDPPerGame, 
                  data = ABat)

AwayRegress1 <- lm(sumGIDP ~ meanKper9 + meanGDPPerGame, 
                  data = ABat)

summary(AwayRegress1)

HomeScoreRegress <- lm(meanHomeScore ~ sumHits + sumHR  + sumRBI + sumBB + sumk + sumSB + sumCS + sumSacHit + sumSacFly + sumGIDP, 
                       data = HBat)

HomeScoreRegress1 <- lm(meanHomeScore ~ sumRBI + + sumk + sumGIDP, 
                       data = HBat)

summary(HomeScoreRegress1)

HomeRegress <- lm(sumk ~ meanWHIP + meanHitsper9 + meanERA + meanHRPer9 + meanBBPer9 + meanKper9 + meanBASeason
                  + meanOBPSeason + meanSlugSeason + meanPctGWH + meanRunsPerGame + meanHitsPerGame + meanDoublePerGame + 
                    meanTriplePerGame + meanHRPerGame + meanRBIPerGame + meanWalksPerGame + meanIBBPerGame + meanHBPPerGame +
                    meanKPerGame + meanSBPerGame + meanCSPerGame + meanSHPerGame + meanSFPerGame + meanGDPPerGame, 
                  data = HBat)

HomeRegress1 <- lm(sumk ~ meanKper9 + meanKPerGame, 
                   data = HBat)

summary(HomeRegress1)
