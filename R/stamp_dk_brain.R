
compute_brain_dk_stamp <- function(data, scales, hemi = NULL, side = NULL, region = NULL){

   dk_reference %>%
    rename(Hemi = hemi) %>%
    rename(Side = side) %>%
    rename(Region = region) ->
   mod

  if(!is.null(hemi)){mod <- mod %>% filter(Hemi %in% hemi)}
  if(!is.null(side)){mod <- mod %>% filter(Side %in% side)}
  if(!is.null(region)){mod <- mod %>% filter(Region %in% region)}

   mod

}

StatBdksegstamp <- ggplot2::ggproto(`_class` = "StatBdksegstamp",
                               `_inherit` = ggplot2::Stat,
                               compute_panel = compute_brain_dk_stamp,
                               default_aes = ggplot2::aes(geometry = ggplot2::after_stat(geometry))
)

#' Title
#'
#' @param mapping
#' @param data
#' @param position
#' @param na.rm
#' @param show.legend
#' @param inherit.aes
#' @param ... hemi may be "left" or "right", side may be 'lateral' or 'medial'
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(tidyverse)
#'  ggplot() +
#'  stamp_dk_brain(alpha = .5, fill = "blue") +
#' stamp_dk_brain(hemi = "left", fill = "black") +
#'  stamp_dk_brain(side = "lateral", hemi = "right", fill = "green") +
#'  stamp_dk_brain(region = "insula", fill = "pink")
#'
stamp_dk_brain <- function(
  mapping = NULL,
  data = dk_reference,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE, ...) {
  c(ggplot2::layer(
    stat = StatBdksegstamp,  # proto object from step 2
    geom = ggplot2::GeomSf,  # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = rlang::list2(na.rm = na.rm, ...)),
    coord_sf(default = TRUE)  )
}




#' Title
#'
#' @param side
#' @param region
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot() +
#' stamp_dk_hemi_left()
stamp_dk_hemi_left <- function(side = NULL, region = NULL, ...) {

  stamp_dk_brain(hemi = "left", side = side, region = region, ...)


}

#' Title
#'
#' @param side
#' @param region
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot() +
#' stamp_dk_hemi_right()
stamp_dk_hemi_right <- function(side = NULL, region = NULL, ...) {

  stamp_dk_brain(hemi = "right", side = side, region = region, ...)


}

#' Title
#'
#' @param side
#' @param region
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot() +
#' stamp_dk_side_lateral()
stamp_dk_side_lateral <- function(hemi = NULL, region = NULL, ...) {

  stamp_dk_brain(hemi = hemi, side = 'lateral', region = region, ...)


}

#' Title
#'
#' @param side
#' @param region
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot() +
#' stamp_dk_side_medial()
stamp_dk_side_medial <- function(hemi = NULL, region = NULL, ...) {

  stamp_dk_brain(hemi = hemi, side = 'medial', region = region, ...)


}



#' Title
#'
#' @return
#' @export
#'
#' @examples
#' return_regions_dk()
return_regions_dk <- function(){

  dk_reference$region %>% unique() %>% sort()
}

