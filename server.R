#
# # This is the server logic for a Shiny web application.
# # You can find out more about building applications with Shiny here:
# #
# # http://shiny.rstudio.com
# #
#

library(shiny)
data("iris")
shinyServer(function(input, output) {
  # output$text0species <- renderText({
  #   colm = as.numeric(input$species)
  #   paste("Selected Species is: ", input$species))
  # })
  output$text1var <- renderText({
    colm = as.numeric(input$var)
    paste("Selected Dataset column is: ", names(iris[colm]))
  })
  output$text2bin <- renderText({
    paste("Number of histogram BINs is: ", input$bin)
  })
  
  output$text3colour <- renderText({
    paste("Colour of histogram is: ", input$radio)
  })
  
  output$distPlot <- renderPlot({
    colm = as.numeric(input$var)
    hist(
      iris[, colm],
      freq = FALSE,
      col = input$radio,
      xlab = names(iris[colm]),
      main = "Colored histogram",
      breaks = seq(0, max(iris[, colm]), l = input$bin + 1)
    )
    
    # add a normal distribution line in histogram
    curve(dnorm(x,
                mean = mean(iris[, colm]),
                sd = sd(iris[, colm])),
          add = TRUE,
          col = "red") #line
  })

})