
library(ggplot2)
library(scales)
library(ggmap)
library(dplyr)

# crimeDat <- readRDS("usaCrimeDat.rds") %>%
#   filter(state != 'district of columbia')
crimeDat <- read.csv("life-expectancy.csv")

mdat <- map_data("state")

shinyServer(function(input, output) {
  
  # setting the reactive environment 
  dataInput <- reactive({
    crimeDat[,c(input$myVar1,input$myVar2)]
  })
  
  
    output$myMap <- renderPlot({ 
      myDat <- dataInput()
      colnames(myDat) <- c("v1","v2")
      ggplot(myDat, aes(x=v1, y=v2)) + geom_point()

    })

  output$myPlot <- renderPlot({ 
    dd <- dataInput()
    qplot(dd[,1],dd[,2])
    
  }) 
  
  # PLotting the bar plots
#   output$myPlot <- renderPlot({
#     ggplot(dataInput(), aes(reorder(state,rate),rate))+ 
#       geom_point(color="steelblue", size=4)+
#       coord_flip() + theme_bw() 
#     
#   })
  
  # Plotting the usa map
#   output$myMap <- renderPlot({ 
#     combdat <- merge(mdat, dataInput(), by.x=c('region'), 
#                      by.y=c('state'), all.x=TRUE)
#     odat <- combdat[order(combdat$order),]
#     ggplot(odat, aes(x=long, y=lat,group=group)) +
#       geom_polygon(aes(fill=rate), colour = alpha("white", 0.2)) + 
#       theme_bw() + scale_fill_continuous(low="blue", high="pink") +
#       theme(
#         legend.position = "none",
#         text = element_blank(), 
#         line = element_blank()) 
#   })
#   
#   output$myCrime <- renderPlot({ 
#     sDat <- dataInput() %>% 
#       arrange(-rate)
#     topState <- sDat$state[1]
#     subDat <- subset(crimeDat,state==topState)
#     ggplot(subDat, aes(x=Year, y=rate,color=Crime)) + geom_line()+
#       theme_bw() + ggtitle(topState)+ theme(legend.position="bottom") + 
#       guides(colour = guide_legend(nrow = 2))+ 
#       ylab("Rate/10,000 people")
#   })
#   
})


