
compute_brain_dk <- function(data, scales){

  data %>%
    inner_join(dk_reference)

}

StatBdkseg <- ggplot2::ggproto(`_class` = "StatBdkseg",
                               `_inherit` = ggplot2::Stat,
                               compute_panel = compute_brain_dk,
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
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#' library(ggplot2)
#' library(tidyverse)
#' c("fusiform",
#'"inferior parietal"	,
#' "insula", "precentral"
#' ) %>% tibble(my_region = .) %>%
#'  mutate(value = 1:4) %>%
#'  mutate(name = letters[1:4] %>% as.factor()) %>%
#'  ggplot() +
#'  aes(region = my_region, fill = value) +
#'  coord_sf() +
#'  geom_sf(data = ggseg::dk$data,
#'          aes(region = NULL, fill = NULL) # huh?  required?
#'  ) +
#'  geom_dk_brain(alpha = .5)
geom_dk_brain <- function(
  mapping = NULL,
  data = NULL,
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE, ...) {
  c(ggplot2::layer(
    stat = StatBdkseg,  # proto object from step 2
    geom = ggplot2::GeomSf,  # inherit other behavior
    data = data,
    mapping = mapping,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = rlang::list2(na.rm = na.rm, ...)),
    coord_sf(default = TRUE)  )
}






