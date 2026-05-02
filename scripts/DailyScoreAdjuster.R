library (readxl)
library (openxlsx)
library (dplyr)

#fixes dates in daily score results

library(readxl)
DateFix <- read_excel("mlb2025asplayed.xlsx")

DateFix <- DateFix |>
  mutate(
    month= as.numeric(format(Date, "%m")),
    day= as.numeric(format(Date, "%d")),
    year= as.numeric(format(Date, "%Y"))
    
  )

write_xlsx(DateFix, "Daily Scores.xlsx")
