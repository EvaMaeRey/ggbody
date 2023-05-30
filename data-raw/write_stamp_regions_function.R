# example
stamp_frontal_pole <- function(hemi = NULL, side = NULL, ...) {

  stamp_dk_brain(hemi = hemi, side = side, region = 'frontal pole', ...)


}

# template
region_stamp_template <- "### Do not modify directly use write stam regions template and writer


#' Title
#'
#' @param mapping
#' @param data
#' @param position
#' @param na.rm
#' @param show.legend
#' @param inherit.aes
#' @param ... hemi may be 'left' or 'right', side may be 'lateral' or 'medial'
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(tidyverse)
#'  ggplot() +
#'  stamp_dk_brain(alpha = .5, fill = 'blue') +
#' stamp_dk_brain(hemi = 'left', fill = 'black') +
#'  stamp_dk_brain(side = 'lateral', hemi = 'right', fill = 'green') +
#'  stamp_dk_frontal_pole(fill = 'pink')
#'
stamp_dk_frontal_pole <- function(hemi = NULL, side = NULL, ...) {

stamp_dk_brain(hemi = hemi, side = side, region = 'frontal pole', ...)


}"




# Write documentation for all regions

for ( i in dk_reference$region){

  i_w_underscore <- i %>% str_replace_all(" ", "_")

  region_stamp_template |>
    str_replace_all("frontal_pole", i_w_underscore) |>
    str_replace_all('frontal pole', i) |>
  writeLines(paste0("R/stamp_dk_", i_w_underscore, ".R"))

}

