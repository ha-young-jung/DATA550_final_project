here::i_am(
  "code/01_data_preprocessing.R"
)

library(dplyr)

# Import data
dat <- readRDS(here::here("raw_data", "ga_opioid_data.rds"))

# Categorize mortality rate
dat$mort_rate <- ifelse(dat$mort_rate < 0.1, 'Low',
                        ifelse(dat$mort_rate < 0.2, 'Moderate', 'High'))
dat$mort_rate <- factor(dat$mort_rate, levels = c("Low", "Moderate", "High"))

# Factorize Rural-Urban Continuum Code (rucc_code13_5)
dat$rucc_code13_5 <- factor(dat$rucc_code13_5, levels = c("lcm_lfm", "mm", "sm", "mi_non"),
                            labels = c("Large Central Metro & Large Fringe Metro", "Medium Metro", "Small Metro", "Micropolitan & Non-Metro"))

# Save it to another file
saveRDS(
  dat,
  file = here::here("data", "dat.rds")
)
