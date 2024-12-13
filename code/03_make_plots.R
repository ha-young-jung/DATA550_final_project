here::i_am(
  "code/03_make_plots.R"
)

dat <- readRDS(
  file = here::here("data", "dat.rds")
)

library(tidyverse)
library(sf)

# rucc_code13
bar_rucc <- ggplot(dat, aes(x = fct_infreq(rucc_code13), fill = rucc_code13)) +
  geom_bar() +
  scale_fill_brewer(palette = "Greens", direction = -1) +
  geom_text(stat='count', aes(label = after_stat(count)), vjust = -0.3) +
  scale_x_discrete(labels = c("Non-Metro", "Small Metro", "Large Fringe Metro", "Micropolitan", "Medium Metro", "Large Central Metro"), name = "Rural-Urban Continuum Code") +
  theme(axis.text.x = element_text(angle = 35, hjust = 1)) +
  theme(legend.position = "none")

ggsave(
  here::here("output/bar_rucc.png"),
  plot = bar_rucc,
  device = "png"
)

# unemployment_rate
outlier <- dat |>
  filter(unemployment_rate > 20) |>
  st_drop_geometry()

hist_unemp <- ggplot(dat, aes(x = unemployment_rate)) +
  geom_histogram() +
  geom_histogram(data = outlier,
                 aes(x = unemployment_rate),
                 fill = 'red') +
  annotate("text", x=21.5, y=1.5, label= "Quitman", size=3.5) +
  ylab("count")

ggsave(
  here::here("output/hist_unemp.png"),
  plot = hist_unemp,
  device = "png"
)
