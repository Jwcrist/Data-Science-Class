
library(ggplot2)
library(ggvis)
library(dplyr)

mdat<-map_data("state")

mdat %>%
  arrange(group,order) %>%
  ggvis(x=~long,y=~lat) %>%
  layer_paths()
