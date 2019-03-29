#Things you can do
#1. change page type
#2. set title


library(shiny)


# Define UI for application that draws a histogram
#fluidPage has main and side panels
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Linear Prediction of Old Faithful Waiting Time"),
  
  # Sidebar input wait time
  sidebarLayout(
    sidebarPanel(
      
      p("Input wait time in minutes(below) to see eruption time expected from linear regression model"),
      
      numericInput("wait_time", 
                                h3("Wait Time(min)"), 
                                value = 60,
                                min=40,
                                max=96),
       actionButton('submit',"Submit")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type='tabs',
                  
       tabPanel('Scatter Plot and Prediction', plotOutput('linePlot'),
                DT::dataTableOutput("Combined_table")),
       tabPanel("Model Summary", verbatimTextOutput("summary"))
    ))
  
)))
