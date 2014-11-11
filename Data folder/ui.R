

#crimeDat <- readRDS("usaCrimeDat.rds")
crimeDat <- read.csv("life-expectancy.csv")


myVariables <- as.character(colnames(crimeDat))

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  ###################### first row starts here
  fluidRow(
    column(12,
           # Application title takes all 12 column spaces
           titlePanel("My Shiny application to explore US crime data")
    )),
  
  ###################### 2nd row starts here. 2 columns 
  fluidRow(
    column(5,
           wellPanel(
             selectInput("myVar1", 
                         label = "Choose Variable to display",
                         choices = myVariables, 
                         selected = myVariables[1]),
             
             selectInput("myVar2", 
                         label = "Choose Variable to display",
                         choices = myVariables, 
                         selected = myVariables[3]),
            
             sliderInput("myYears",
                         label = "Year of Transportation",
                         min = 1996,
                         max = 2014,
                         value = 1996,
                         step=1),
             
             sliderInput("myYears",
                         "Crime Year",
                         min = 1969,
                         max = 2005,
                         value = 1980),
             "This is a project created to demonstrate how shiny application 
              can be used for exploratory data analysis. For more information 
              about this project please visit github repository 
              https://github.com/mamajumder/usa-crime"
           )
    ),
    column(6, 
           plotOutput("myMap",height = "300px", width="550px")
    )      
  ),
  
  ###################### 3rd row starts here. 2 columns
  fluidRow(
    column(5, 
           plotOutput("myPlot",height = "900px",width="350px")
    ),
    column(6, 
           tableOutput("t3")
    )  
  )
  
  
))
