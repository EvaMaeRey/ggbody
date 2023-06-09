% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stamp_dk_lingual.R
\name{stamp_dk_lingual}
\alias{stamp_dk_lingual}
\title{Title}
\usage{
stamp_dk_lingual(hemi = NULL, side = NULL, ...)
}
\arguments{
\item{...}{hemi may be 'left' or 'right', side may be 'lateral' or 'medial'}
}
\description{
Title
}
\examples{
library(ggplot2)
library(tidyverse)
 ggplot() +
 stamp_dk_brain(alpha = .5, fill = 'blue') +
stamp_dk_brain(hemi = 'left', fill = 'black') +
 stamp_dk_brain(side = 'lateral', hemi = 'right', fill = 'green') +
 stamp_dk_lingual(fill = 'pink')

}
