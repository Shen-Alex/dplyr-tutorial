#https://www.r-bloggers.com/2015/08/data-manipulation-with-dplyr/

head(airquality)

library(datasets)
library(dplyr)

filter(airquality, Temp > 70)

filter(airquality, Temp > 80 & Month > 5)

mutate(airquality, TempInC = (Temp - 32) * 5 / 9)

summarise(airquality, mean(Temp, na.rm = TRUE))

summarise(group_by(airquality, Month), mean(Temp, na.rm = TRUE))

sample_n(airquality, size = 10)
sample_frac(airquality, size = 0.1)

count(airquality, Month)

arrange(airquality, desc(Month), Day)

filteredData <- filter(airquality, Month != 5)
groupedData <- group_by(filteredData, Month)
summarise(groupedData, mean(Temp, na.rm = TRUE))

airquality %>% 
  filter(Month != 5) %>% 
  group_by(Month) %>% 
  summarise(mean(Temp, na.rm = TRUE))


