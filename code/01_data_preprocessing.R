here::i_am(
  "code/01_data_preprocessing.R"
)

library(tidyverse)
library(sf)

# Import Data
load(here::here("raw_data", "GeorgiaMapData.RData"))

ga_clean <- ga_map_data %>% 
  select(-c(DP03_0119PE, DP04_0003PE, DP03_0009PE, DP05_0065PE, Name.y, Name_Seat.y)) %>% # select variables
  rename(Name = Name.x ,
         Name_Seat = Name_Seat.x) %>%
  mutate(mort_rate = incidence*1000) %>%
  relocate(mort_rate, .after = incidence) %>%
  relocate(unemployment_rate_out, .after = unemployment_rate) %>%
  relocate(dist_to_usroad, dist_to_treatment, .after = pct_black) %>%
  relocate(pct_black_std, .after = unemployment_rate_out_std)

# Replace Missing Values for Name and Name_Seat
dat[51, 19:20] <- "Appling"
dat[157, 19:20] <- "Statenville"

# save it to another file
saveRDS(
  dat,
  file = here::here("data", "dat.rds")
)
