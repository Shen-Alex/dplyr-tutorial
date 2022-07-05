#https://www.r-bloggers.com/2021/02/hands-on-r-and-dplyr-analyzing-the-gapminder-dataset/#google_vignette

library(dplyr)
library(gapminder)

head(gapminder)



gapminder %>%
  filter(
    continent == "Americas",
    country == "United States",
    year %in% c(1997, 2002, 2007)
  )



gapminder %>%
  filter(
    year == 2007,
    continent == "Americas",
    country == "United States"
  ) %>%
  summarize(mean(lifeExp))


gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarize(avgLifeExp = mean(lifeExp))


gapminder %>%
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(totalPop = sum(pop)) %>%
  arrange(desc(totalPop))


gapminder %>%
  filter(year == 2007) %>%
  mutate(totalGdp = pop * gdpPercap)


gapminder %>%
  filter(year == 2007) %>%
  mutate(percentile = ntile(lifeExp, 100)) %>%
  arrange(desc(gdpPercap))


gapminder %>%
  filter(year == 2007) %>%
  mutate(percentile = ntile(lifeExp, 100)) %>%
  arrange(gdpPercap)



gapminder %>%
  filter(year == 2007) %>%
  mutate(percentile = ntile(lifeExp, 100)) %>%
  filter(percentile > 90) %>%
  arrange(desc(percentile)) %>%
  top_n(10, wt = percentile) %>%
  select(continent, country, lifeExp, percentile)


gapminder %>%
  filter(year == 2007) %>%
  mutate(percentile = ntile(lifeExp, 100)) %>%
  filter(percentile < 10) %>%
  arrange(percentile) %>%
  top_n(-10, wt = percentile) %>%
  select(continent, country, lifeExp, percentile)

