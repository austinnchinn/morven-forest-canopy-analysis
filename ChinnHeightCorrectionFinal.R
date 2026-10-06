# title: "Tree Height Correction"
# author: "Austin Chinn"

## load data
library(tidyverse)
library(dplyr)
library(purrr)
library(broom)

height_raw <- readr::read_csv(# directory
  )
summary(height_raw)


## Create Supersite and Transect columns, group, and filter

height <- height_raw |>
  mutate(SITEID = as.numeric(substr(PLOTID, 1, 2))) |>
  mutate(TRANSID = (SITEID - 1) %/% 3 + 1) |>
  group_by(SITEID) |>
  arrange(SITEID, PLOTID)

summary(height)


## Take random sample of 10 >7m trees per site 
# OR take all trees from site if 10 or fewer

set.seed(123)

height_sample <- height |>
  filter(abs(HEIGHT_REAL - HEIGHT) <7) |>
  slice(if (n() > 10) sample(n(), 10) else 1:n())


## Create regression table
# Create one‑parameter constrained regression model for height correction
correction_models <- height_sample |>
  group_by(TRANSID) |>
  nest() |>
  mutate(
    # Assumed that when height = 15, actual height = 15
    model = map(data, ~ lm(I(HEIGHT_REAL - 15) ~ I(HEIGHT - 15) + 0, data = .x)),
    COEF  = map(model, broom::tidy),
    STATS = map(model, broom::glance)
  ) |>
  select(TRANSID, COEF, STATS)

# Check correlation coefficient table
height_correction <- correction_models |>
  unnest(COEF) |>
  select(TRANSID, term, estimate) |>
  pivot_wider(
    names_from = term,
    values_from = c(estimate),
    names_prefix = "COEF_"
  )


## Output to .csv
readr::write_csv(
  height_correction,
  file = # directory
)