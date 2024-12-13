here::i_am(
  "code/02_data_structure_table1.R"
)

dat <- readRDS(
  file = here::here("data", "dat.rds")
)

library(dplyr)
library(sf)
library(labelled)
library(gtsummary)
library(cardx)

## Data Structure and Summary Table
# Summary Table
var_label(dat) <- list(
  rucc_code13_5  = "Rural-Urban Continuum Code",
  mortality = "Mortality Count",
  population = "Population",
  mort_rate = "Mortality rate",
  pct_poverty = "Poverty rate",
  vacancy_rate = "Vacancy rate",
  unemployment_rate = "Unemployment rate",
  pct_black = "Percentage of Black Population",
  dist_to_usroad = "Distance to interstate",
  dist_to_treatment = "Distance to treatment"
)

table_one <- dat |>
  st_drop_geometry() |>
  select("rucc_code13_5", "mortality", "population", "pct_poverty", "vacancy_rate", "unemployment_rate",
         "pct_black", "dist_to_usroad", "dist_to_treatment", "mort_rate") |>
  tbl_summary(by = mort_rate) |>
  modify_spanning_header(c("stat_1","stat_2", "stat_3") ~ "**Mortality rate**") |>
  modify_caption("**Summary Table with rucc_code13_5**") |>
  add_overall() |>
  bold_labels() |>
  add_p()

saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)