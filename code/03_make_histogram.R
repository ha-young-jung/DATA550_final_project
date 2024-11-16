here::i_am(
  "code/03_make_histogram.R"
)

dat <- readRDS(
  file = here::here("data", "dat.rds")
)

library(ggplot2)

# pct_poverty
hist_poverty <- ggplot(dat) +
  geom_histogram(aes(x=pct_poverty)) +
  ggtitle("Histogram of Poverty Rate")

ggsave(
  here::here("output/hist_poverty.png"),
  plot = hist_poverty,
  device = "png"
)

# vacancy_rate
hist_vacancy <- ggplot(dat) +
  geom_histogram(aes(x=vacancy_rate)) +
  ggtitle("Histogram of Vacancy Rate")

ggsave(
  here::here("output/hist_vacancy.png"),
  plot = hist_vacancy,
  device = "png"
)

# unemployment_rate_out
hist_unemp <- ggplot(dat) +
  geom_histogram(aes(x=unemployment_rate_out)) +
  ggtitle("Histogram of Unemployment Rate")

ggsave(
  here::here("output/hist_unemp.png"),
  plot = hist_unemp,
  device = "png"
)

# pct_black
hist_black <- ggplot(dat) +
  geom_histogram(aes(x=pct_black)) +
  ggtitle("Histogram of Percentage of Black Population")

ggsave(
  here::here("output/hist_black.png"),
  plot = hist_black,
  device = "png"
)

# dist_to_usraod
hist_road <- ggplot(dat) +
  geom_histogram(aes(x=log(dist_to_usroad))) +
  ggtitle("Histogram of Distance to Interstate")

ggsave(
  here::here("output/hist_road.png"),
  plot = hist_road,
  device = "png"
)

# dist_to_treatment
hist_trt <- ggplot(dat) +
  geom_histogram(aes(x=log(dist_to_treatment))) +
  ggtitle("Histogram of Distance to Treatment Centers")

ggsave(
  here::here("output/hist_trt.png"),
  plot = hist_trt,
  device = "png"
)
