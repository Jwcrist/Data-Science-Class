library(ggplot2)
library(scales)
library(ggmap)
library(dplyr)

StreamlineDat <- read.csv("life-expectancy.csv")
#tail(StreamlineDat)
#myVariables <- as.character(unique(colnames(StreamlineDat)))
#mdat <- map_data("state")
shinyServer(function(input, output) {
  
# setting the reactive environment 
#   
#  selectedData<- reactive({
#    myVariables[,c(input$myVar1,input$myVar2)]
#  })
#   
  # PLotting the bar plots
 
  output$myPlot <- renderPlot({
    environment<-environment()
    ggplot(StreamlineDat,aes(StreamlineDat[,input$myVar1],StreamlineDat[,input$myVar2]),
           environment=environment)+geom_point()

    
    })
  })
  
  # Plotting the usa map
  #output$myMap <- renderPlot({ 
  #  combdat <- merge(mdat, dataInput(), by.x=c('region'), 
  #                   by.y=c('state'), all.x=TRUE)
  #  odat <- combdat[order(combdat$order),]
  #  ggplot(odat, aes(x=long, y=lat,group=group)) +
  #    geom_polygon(aes(fill=rate), colour = alpha("white", 0.2)) + 
  #    theme_bw() + scale_fill_continuous(low="blue", high="pink") +
  #    theme(
  #      legend.position = "none",
  #      text = element_blank(), 
  #      line = element_blank()) 
  #})
#  
#  output$myVariables <- renderPlot({ 
#    sDat <- dataInput() %>% 
#      arrange(-rate)
#    topState <- sDat$state[1]
#    subDat <- subset(StreamlineDat,state==topState)
#    ggplot(subDat, aes(x=Year, y=rate,color=Crime)) + geom_line()+
#      theme_bw() + ggtitle(topState)+ theme(legend.position="bottom") + 
#      guides(colour = guide_legend(nrow = 2))+ 
#      ylab("Rate/10,000 people")
#  })
  
#})


