### Do not modify directly use write stam regions template and writer


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
#'  stamp_dk_paracentral(fill = 'pink')
#'
stamp_dk_paracentral <- function(hemi = NULL, side = NULL, ...) {

stamp_dk_brain(hemi = hemi, side = side, region = 'paracentral', ...)


}
