## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(jpucd)

## -----------------------------------------------------------------------------
list.files(system.file("extdata",package="jpucd"))

## -----------------------------------------------------------------------------
library(jpucd)
shppath <- system.file("extdata",package="jpucd")
shpfile <- paste(shppath,list.files(shppath,pattern=".zip")[1],sep="/")
kmlfile <- openkmzzip(shpfile)

