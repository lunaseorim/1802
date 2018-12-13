library(ggmap)
library(ggplot2)
library(raster)
library(rgeos)
library(maptools)


data <- read.csv("data/sidodata.csv")
as.character(data$X)
geocode('sejong')



korea <- shapefile("data/TL_SCCO_CTPRVN.shp")
korea <- spTransform(korea,CRS("+proj=longlat"))
korea_map <- fortify(korea)
merge_result <- merge(korea_map,data,by='id')

p <- ggplot() +
  geom_polygon(data = merge_result,aes(x=long,y=lat,group=group,
                                       fill = 비율)) +
  geom_text(data = korea, aes(x = long, y = lat, label = 비율))

p +
  scale_fill_gradient(low = 'white',high='red')
  
