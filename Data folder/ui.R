StreamlineDat <- read.csv("life-expectancy.csv")
myVariables <- as.character(unique(colnames(StreamlineDat)))

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  ###################### first row starts here
  fluidRow(
    column(12,
           # Application title takes all 12 column spaces
           titlePanel("Application to explore 'Streamline' buying patterns")
    )),
  
  ###################### 2nd row starts here. 2 columns 
  fluidRow(
    column(5,
           wellPanel(
             selectInput("myVar1", 
                         label = "Choose Variable to display",
                         choices = myVariables, 
                         selected = myVariables[3]),
             
             selectInput("myVar2", 
                         label = "Choose Variable to display",
                         choices = myVariables, 
                         selected = myVariables[4]),
            
             sliderInput("myYears",
                         label = "Year of Transportation",
                         min = 1996,
                         max = 2014,
                         value = 1996,
                         step=1),
             
             sliderInput("myMonths",
                         label = "Month of Transportation",
                         min = 01,
                         max = 12,
                         value = 6),
             "This is a project created to explore Streamline's buying patterns
             of customers who visit their webpage."
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
           plotOutput("myCrime",height = "400px", width="550px")
    )  
  )
  
  
))
