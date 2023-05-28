## code to prepare `DATASET` dataset goes here

library(ggseg)
library(tidyverse)

dk_geometries_frame <- ggseg::dk$data
aseg_geometries_frame <- ggseg::aseg$data


aseg_df <- ggseg::aseg$data
aseg_df$geometry <- NULL
aseg_df <- aseg_df %>% data.frame() %>% remove_missing()


aseg_df %>% count(label)

# aseg_df %>% #count(region)
# mutate(label = label %>% as.factor()) %>%
ggplot() +
  aes(hemi = hemi, side = side, region = region, label = label, roi = roi) +  # name indicates position instead of x and y
  geom_sf(data = ggseg::dk$data)

last_plot() %>% layer_data() %>%
  select(hemi, side, region, label,
         roi, geometry, xmin, xmax, ymin, ymax) %>%
  filter(!is.na(label)) ->
dk_reference

usethis::use_data(dk_reference, overwrite = TRUE)


