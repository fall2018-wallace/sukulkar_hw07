
library(maps)
library(ggmap)

mapState <- map_data("state")
dfMergedACN$stateName<-tolower(dfMergedACN$stateName)

#Creating a color coded map, based on the area of the state
mapAreaState <- ggplot(dfMergedACN, aes(map_id = stateName))   
mapAreaState <- mapAreaState + geom_map(map = mapState, fill = "blue", color = "black")  
mapAreaState <- mapAreaState + expand_limits(x = mapState$long, y = mapState$lat)
mapAreaState
mapAreaState <- mapAreaState + geom_map(map = mapState,aes(fill=state.area))
mapAreaState <- mapAreaState + ggtitle("Area Map of the State")
mapAreaState

#Creating a color coded map, based on the murder rate of each state
mapMurderState <- ggplot(dfMergedACN, aes(map_id = stateName))   
mapMurderState <- mapMurderState + geom_map(map = mapState, aes(fill = Murder))  
mapMurderState <- mapMurderState + expand_limits(x = mapState$long, y = mapState$lat)
mapMurderState <- mapMurderState+ coord_map()
mapMurderState <- mapMurderState +ggtitle("Murder Rate of each State")
mapMurderState

#Creating map for population as a circle per state (the larger the population, the larger the circle)
#using the location defined by the center of each state
mapMurderCircle <- mapMurderState + geom_point(x = dfMergedACN$x, y = dfMergedACN$y,aes(size = dfMergedACN$population))
mapMurderCircle<- mapMurderCircle + ggtitle("Murder Rate as a circle per State")
mapMurderCircle

locationLatLong <- geocode(source= "dsk", "nyc,new york, ny")
locationLatLong

mapMurderStateNE <- mapMurderState  + xlim(locationLatLong$lon-10,locationLatLong$lon+10)+ ylim(locationLatLong$lat-10,locationLatLong$lat+10)
mapMurderStateNE
mapMurderCircleNE  <- mapMurderCircle  + xlim(locationLatLong$lon-10,locationLatLong$lon+10)+ ylim(locationLatLong$lat-10,locationLatLong$lat+10)
mapMurderCircleNE
