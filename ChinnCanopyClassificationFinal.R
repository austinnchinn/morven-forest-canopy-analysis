# title: "Morven HF Canopy Classification"
# author: "Austin Chinn"

## Load data
library(dplyr)
library(ggplot2)

CC_trees <- readr::read_csv(# directory
  )
summary(CC_trees)


## K-means classification
trees_kmeans_plot <- CC_trees |>
  group_by(PLOTID) |>
  group_modify(~ {
    km <- kmeans(.x$HEIGHT, centers = 3, nstart = 25)
    .x$LAYER <- km$cluster
    .x
  }) |>
  ungroup()

trees_kmeans_plot <- trees_kmeans_plot |>
  group_by(PLOTID, LAYER) |>
  mutate(layer_mean = mean(HEIGHT)) |>
  ungroup() |>
  group_by(PLOTID) |>
  mutate(
    LAYER = dense_rank(layer_mean)
  ) |>
  mutate(
    LAYER = factor(LAYER,
                   levels = 1:3,
                   labels = c("Shrub","Understory","Canopy"))
  ) |>
  ungroup()


## Export to .csv
readr::write_csv(
  trees_kmeans_plot,
  file = # directory
)