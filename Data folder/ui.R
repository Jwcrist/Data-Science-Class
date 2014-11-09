StreamlineDat <- readRDS("Transformed_Streamline_Data.rds")
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
             selectInput("myVariable1", 
                         label = "Choose Variable to display",
                         choices = myVariables, 
                         selected = myVariables[2]),
             
             selectInput("myVariable2", 
                         label = "Choose Variable to display",
                         choices = myVariables, 
                         selected = myVariables[1]),
            
             sliderInput("myYears",
                         label = "Year of Transportation",
                         min = 13,
                         max = 14,
                         value = 13,
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
