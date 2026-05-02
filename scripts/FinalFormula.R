library(rvest)
library(dplyr)
library(writexl)

#Enters URLs for Data

BatGIDPURL <- "https://www.teamrankings.com/mlb/stat/grounded-into-double-plays-per-game"
BatRunsPerGameURL <- "https://www.teamrankings.com/mlb/stat/runs-per-game"
BatKPerGameURL <- "https://www.teamrankings.com/mlb/stat/strikeouts-per-game"
PitchTeamBullpenERAURL <- "https://www.teamrankings.com/mlb/stat/opponent-last-3-innings-runs-per-game"
PitchKPerGameURL <- "https://www.teamrankings.com/mlb/stat/strikeouts-per-9"
StartingPitERA <- "https://www.baseball-reference.com/leagues/majors/2026-standard-pitching.shtml"

#Reads in tables from 6 webpages

pageGIDP <- read_html(BatGIDPURL)
tablesGIDP <- pageGIDP |> html_table()
web_dataGIDP <- tablesGIDP[[1]]

pageRuns <- read_html(BatRunsPerGameURL)
tablesRuns <- pageRuns |> html_table()
web_dataRuns <- tablesRuns[[1]]

pageBatK <- read_html(BatKPerGameURL)
tablesBatK <- pageBatK |> html_table()
web_dataBatK <- tablesBatK[[1]]

pageBPRuns <- read_html(PitchTeamBullpenERAURL)
tablesBPRuns <- pageBPRuns |> html_table()
web_dataBPRuns <- tablesBPRuns[[1]]

pagePitK <- read_html(PitchKPerGameURL)
tablesPitK <- pagePitK |> html_table()
web_dataPitK <- tablesPitK[[1]]

pageStartPitERA <- read_html(StartingPitERA)
tablesSPitERA <- pageStartPitERA |> html_table()
web_dataSPitERA <- tablesSPitERA[[2]]

#enables user input for home and away teams and their pitchers

HomeTeam <- readline("Home team: ")
AwayTeam <- readline("Away Team: ")
HomeStarter <- readline("Home Starting Pitcher: ")
AwayStarter <- readline("Away Starting Pitcher: ")

#Defines variables needed for final formula

meanAwayPitERA <- web_dataBPRuns |> 
  filter(Team == AwayTeam) |>
  pull(Away)
meanHomeBatRunsPerGame <- web_dataRuns |>
  filter(Team == HomeTeam) |>
  pull(Home)
meanPitcherKPerGame <- web_dataPitK |>
  filter(Team == AwayTeam) |>
  pull(Away)
meanPitcherHomeK <- web_dataPitK |>
  filter(Team == HomeTeam) |>
  pull(Home)
meanHomeBatkPerGame <- web_dataBatK |>
  filter(Team == HomeTeam) |>
  pull(Home)
meanAwayBatkPerGame <- web_dataBatK |>
  filter(Team == AwayTeam) |>
  pull(Away)
meanHomeBatGDPPerGame <- web_dataGIDP |>
  filter(Team == HomeTeam) |>
  pull(Home)
meanHomePitERA <- web_dataBPRuns |>
  filter(Team == HomeTeam) |>
  pull(Home)
meanAwayBatRunsPerGame <- web_dataRuns |>
  filter(Team == AwayTeam) |>
  pull(Away)
meanHomePitKPerGame <- web_dataPitK |>
  filter(Team == HomeTeam) |>
  pull(Home)
meanAwayBatGIDPPerGame <- web_dataGIDP |>
  filter(Team == AwayTeam) |>
  pull(Away)
AwayPitcherERA <- web_dataSPitERA |>
  filter(Player == AwayStarter) |>
  pull(ERA)
HomePitcherERA <- web_dataSPitERA |>
  filter(Player == HomeStarter) |>
  pull(ERA)


#Final Formulas

sumHomeRBI= -2.37148 + .89853*((meanAwayPitERA/3)+ (AwayPitcherERA* .667)) + .689*(meanHomeBatRunsPerGame)
sumHomeK = -5.11361 + .83433*(meanPitcherKPerGame) + .683037*(meanHomeBatkPerGame)
sumHomeGIDP= .64557 - .05169*(meanPitcherKPerGame) + .778756*(meanHomeBatGDPPerGame)

HomeScore= 3.085981 + sumHomeRBI*.822967 - sumHomeK*.253631 - sumHomeGIDP*.295831

print(paste("Home Score: ", HomeScore))

sumAwayRBI= -3.1779 + 1.16316*((meanHomePitERA/3) + HomePitcherERA * .667) + .63107*(meanAwayBatRunsPerGame)
sumAwayK= -3.48677 + .85911*(meanPitcherHomeK) + .53172*(meanAwayBatkPerGame)
sumAwayGIDP= .9356 - .0665*(meanHomePitKPerGame) + .59807*(meanAwayBatGIDPPerGame)

  
AwayScore= 3.604650 + sumAwayRBI*.812243 - sumAwayK*.266278 - sumAwayGIDP*.503419

print(paste("Away Score: ", AwayScore))
