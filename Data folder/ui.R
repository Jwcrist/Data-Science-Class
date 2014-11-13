StreamlineDat <- read.csv("life-expectancy.csv")
myVariables <- as.character(unique(colnames(StreamlineDat)))

# Define UI for application that draws a histogram
shinyUI(navbarPage("Streamline Data",id="nav",
  ###################### first row starts here
tabPanel("Explore Data:",
  fluidRow(
    column(12,
           # Application title takes all 12 column spaces
           titlePanel("Application to explore 'Streamline' buying patterns")
    )),
  
  ###################### 2nd row starts here. 2 columns 
  fluidRow(
    column(6,
           wellPanel(
             selectInput("myVar1", 
                         label = "Choose X variable to display",
                         choices = myVariables, 
                         selected = myVariables[3]),
             
             selectInput("myVar2", 
                         label = "Choose Y variable to display",
                         choices = myVariables, 
                         selected = myVariables[4]),
             
             selectInput("myVar3",
                         label = "Choose faceting variable",
                         choices = myVariables,
                         selected = myVariables[2]),
            
             sliderInput("myYears",
                         label = "Year of Transportation",
                         min = 1960,
                         max = 2012,
                         value = 1965,
                         step=1),
             
             sliderInput("myMonths",
                         label = "Month of Transportation",
                         min = 01,
                         max = 12,
                         value = 9),
             
             checkboxInput("checkbox", 
                           label = "Buys Only?", 
                           value = TRUE),
                     
             "This is a project created to explore Streamline's buying patterns
             of customers who visit their webpage."
           )
    ),
    column(6, 
           plotOutput("myMap",height = "450px", width="500px")
    )      
  ),
  
  ###################### 3rd row starts here. 2 columns
  fluidRow(
    column(5, 
           plotOutput("myPlot",height = "750px",width="750px")
    ),
    column(6, 
           plotOutput("myCrime",height = "400px", width="550px")
    )  
  )
  
  
),
tabPanel("Model:")
))
