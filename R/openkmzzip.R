#' Open a zipped kmz format shapefile
#'
#' @description
#' openkmzzip is created for the purpose of opening 
#' shape files of Japanese census districts that are 
#' published on  the Japanese government's e-Stat 
#' website. 
#' URL: https://www.e-stat.go.jp/gis/statmap-search?page=1&type=2&aggregateUnitForBoundary=A&toukeiCode=00200521
#'
#' Requires: libexpat (https://libexpat.github.io/)
#'
#' @param file Name of zipped shapefile to be unpacked
#'
#' @return path of unzipped kml file
#'
#' @details
#'
#' @examples
#' shppath <- system.file("extdata",package="jpucd")
#' shpfile <- paste(shppath,list.files(shppath,pattern=".zip")[1],sep="/")
#' kmlfile <- openkmzzip(shpfile)
#' 
#' @export
openkmzzip <- function( zipfile )
{
	require(zip)
	require(fs)

# The file as downloaded contains a kmz file, which are 
# zipped kml files inside of an outer zip file.
tmp1 <- tempfile()

zip::unzip( zipfile , exdir=tmp1)

kmzfile <- paste(tmp1,list.files(tmp1,pattern='.kmz')[1],sep="/")

tmp2 <- tempfile()

zip::unzip( kmzfile , exdir=tmp2)

kmlfile <- paste(tmp2,list.files(tmp2,pattern='.kml')[1],sep="/")

# clean up
dir_delete(tmp1)

return(kmlfile)
}
