library(ggplot2)
library(scales)
library(ggmap)
library(dplyr)

StreamlineDat <- read.csv("life-expectancy.csv")
#gsub()
mdat <- map_data("state")

shinyServer(function(input, output) {
  
  dataInput<-reactive({
  
    mYear<-input$myYears
    mMonths<-input$myMonths
    
    StreamlineDat1<-StreamlineDat %>%
      filter(
          YR=mYear,
          MO=mMonths)
    
#   StreamlineDat %>%
#       select(YR=input$myYears, MO=input$myMonths)
  
#    StreamlineDat[,c(input$myVar1,input$myVar2,input$myVar3)]
 
    StreamlineDat1[,c(input$myVar1,input$myVar2,input$myVar3)]
      
  }) 


output$myPlot<-renderPlot({
  myDat<-dataInput()
  colnames(myDat)<-c('v1','v2','v3')
  Titlemaps<-paste("Plot of ",input$myVar1, " vs ",input$myVar2," faceted by ", input$myVar3)
  ggplot(myDat,aes(x=v1,y=v2, alpha = 0.15,color=v3))+
    geom_point()+theme(axis.text.x = element_text(angle=90,hjust=1))+facet_wrap(~v3)+
    labs(title = Titlemaps,x=input$myVar1,y=input$myVar2)
})
  output$myMap<-renderPlot({
    myDat<-dataInput()
    colnames(myDat)<-c('v1','v2','v3')
    Titlemaps<-paste("Plot of ",input$myVar1, " vs ",input$myVar2," faceted by ", input$myVar3)
    ggplot(myDat,aes(x=v1,y=v2,alpha=0.25))+
      geom_smooth()+theme(axis.text.x = element_text(angle=90,hjust=1))+facet_wrap(~v3)+
      labs(title = Titlemaps,x=input$myVar1,y=input$myVar2)
  })    
    
})


