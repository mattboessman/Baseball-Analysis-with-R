library(dplyr)
library(openxlsx)
library(rvest)
library(tidyr)
library(readxl)

#Adding Per Game Variables for Home and Away Data

HomeModel <- read_excel("MLBStuff/MasterDataHomeBatters.xlsx")

HomeModel <- HomeModel |>
  
  mutate(
  RunsPerGame = RunsSeason/Games,
  HitsPerGame = HitsSeason/Games,
  DoublePerGame = `2BSeason`/Games,
  TriplePerGame = `3BSeason`/Games,
  HRPerGame = HRSeason/Games,
  RBIPerGame = RBISeason/Games,
  WalksPerGame = BBSeason/Games,
  IBBPerGame = IBBSeason/Games,
  HBPPerGame = HBPSeason/Games,
  KPerGame = Kseason/Games,
  SBPerGame = SBSeason/Games,
  CSPerGame = CSSeason/Games,
  SHPerGame = SHSeason/Games,
  SFPerGame = SFSeason/Games,
  GDPPerGame = GDPSeason/Games
  
)
write.xlsx(HomeModel, "UpdatedMasterHomeBatters.xlsx")

AwayModel<- read_excel("MLBStuff/MasterDataAwayBatters.xlsx")

AwayModel <- AwayModel |>
  
  mutate(
    RunsPerGame = RunsSeason/Games,
    HitsPerGame = HitsSeason/Games,
    DoublePerGame = `2BSeason`/Games,
    TriplePerGame = `3BSeason`/Games,
    HRPerGame = HRSeason/Games,
    RBIPerGame = RBISeason/Games,
    WalksPerGame = BBSeason/Games,
    IBBPerGame = IBBSeason/Games,
    HBPPerGame = HBPSeason/Games,
    KPerGame = Kseason/Games,
    SBPerGame = SBSeason/Games,
    CSPerGame = CSSeason/Games,
    SHPerGame = SHSeason/Games,
    SFPerGame = SFSeason/Games,
    GDPPerGame = GDPSeason/Games
  )

write.xlsx(AwayModel, "UpdatedMasterAwayBatters.xlsx")



UpdatedHome <- read_excel("MLBStuff/UpdatedMasterHomeBatters.xlsx")
UpdatedAway <- read_excel("MLBStuff/UpdatedMasterAwayBatters.xlsx")

HomeReg <- lm(Hits ~ RunsPerGame + HitsPerGame + DoublePerGame + TriplePerGame + HRPerGame + RBIPerGame + WalksPerGame +  
              IBBPerGame + HBPPerGame + KPerGame + SBPerGame + CSPerGame + SHPerGame + SFPerGame +   
              GDPPerGame + HitsPer9 + ERA + Cy + HRPer9 + BBPer9 + KPer9 + BASeason + OBPSeason + SlugSeason + PctGWH, 
              data = UpdatedHome)


HomeReg2 <- lm(HomeScore ~ RunsPerGame + HitsPer9 + ERA + Cy + BBPer9 + KPer9 + BASeason + PctGWH, 
                            data = UpdatedHome)


summary(HomeReg2)


AwayReg <- lm(AwayScore ~ RunsPerGame + HitsPerGame + DoublePerGame + TriplePerGame + HRPerGame + RBIPerGame + WalksPerGame +  
                IBBPerGame + HBPPerGame + KPerGame + SBPerGame + CSPerGame + SHPerGame + SFPerGame +   
                GDPPerGame + HitsPer9 + ERA + Cy + HRPer9 + BBPer9 + KPer9 + BASeason + OBPSeason + SlugSeason + PctGWH, 
              data = UpdatedAway)

AwayReg2 <- lm(AwayScore ~ RunsPerGame + HitsPerGame + DoublePerGame + TriplePerGame + HRPerGame + RBIPerGame + WalksPerGame +  
                 IBBPerGame + HBPPerGame + KPerGame + SBPerGame + CSPerGame + SHPerGame + SFPerGame +   
                 GDPPerGame + HitsPer9 + ERA + Cy + HRPer9 + BBPer9 + KPer9 + BASeason + OBPSeason + SlugSeason + PctGWH, 
               data = UpdatedAway)

HomeReg3 <- lm(HomeScore ~ RunsPerGame + HitsPer9 + ERA + BBPer9,
               data = UpdatedHome)

summary(HomeReg3)

