#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(DT)



# Define logic for plots to render
shinyServer(function(input, output) {

  m1 <- lm(eruptions~waiting, data=faithful)

  
  output$linePlot <- renderPlot({
    
    # draw the histogram with the specified number of bins
    plot(faithful$waiting, faithful$eruptions, xlab= "Waiting Time(min)", ylab='Eruption Time(min)')
    abline(m1, col='red')
    points(input$wait_time, predict(m1, data.frame('waiting'=input$wait_time)), col='green', pch=3, cex=2)

    
  })

  output$summary <- renderPrint({
    names(m1$coefficients) <- c("Intercept", "Waiting Time")
    summary(m1)
  })
  
  
  #Initial Dataframe
  FinalData = eventReactive(input$submit,{
    Testdata = data.frame("input_wait" = input$wait_time, "pred_erupt"= predict(m1, data.frame('waiting'=input$wait_time)))
  })
  
  #Initial Table
  
  #Combined Table
  output$Combined_table = renderDataTable(FinalData())
  
}#Server End
)
