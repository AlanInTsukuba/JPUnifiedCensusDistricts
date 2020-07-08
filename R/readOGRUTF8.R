#' Open a geojson format shapefile with UTF-8 encoding
#'
#' @description
#' readOGRUTF8 is created for the purpose of opening 
#' shape files that have property data encoded in UTF-8
#' so that the property data can be read in RGUI
#' and written with writeOGR. 
#'
#' Background: use_iconv=TRUE in readOGR converts encoded 
#' property fields to a data.frame that can be read on screen.
#' But when written using writeOGR, these fields are not 
#' written. A workaround is to read the file with use_iconv=FALSE
#' then use Encoding(x) to set the encoding for data.frame columns.
#' 
#' Requires: rgdal (https://libexpat.github.io/)
#'
#' @param file Name of geojson shapefile to be unpacked
#'
#' @return Spatial object
#'
#' @details
#'
#' @examples
#' 
#' @export
readOGRUTF8 <- function( dsn, layer, encoding="UTF-8",use_iconv=FALSE, ... )
{
	require(rgdal)
	require(foreach)

shp <- readOGR(dsn, layer,encoding="UTF-8", use_iconv=FALSE,...) ## 

for (name in colnames(shp@data[,sapply(shp@data, is.character)])){
  Encoding(shp@data[[name]]) <- "UTF-8"}

return(shp )
}
