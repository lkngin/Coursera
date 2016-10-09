# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(markdown)

shinyUI(navbarPage(
  "ShinyApp - IRIS Dataset",
  tabPanel("Home",
           # Sidebar with a slider input for number of bins
           sidebarLayout(
             sidebarPanel(
               # selectInput(
               #   "species",
               #   label = "Select the Species",
               #   choices = c(
               #     "setosa" = 1,
               #     "versicolor" = 2,
               #     "virginica" = 3
               #   ),
               #   selected = 1
               # ),
               selectInput(
                 "var",
                 label = "Select the Attributes",
                 choices = c(
                   "Sepal.Length" = 1,
                   "Sepal.Width" = 2,
                   "Petal.Length" = 3,
                   "Petal.Width" = 4
                 ),
                 selected = 3
               ),
               sliderInput(
                 "bin",
                 "Select the number of BINS",
                 min = 10,
                 max = 60,
                 value = 5
               ),
               radioButtons(
                 "radio",
                 label = "Set the histogram color",
                 choices = c("Yellow", "Green", "Cyan"),
                 select = "Green"
               )
             ),
             # Main Panel - Show a plot of the generated distribution
             mainPanel(
               # textOutput("text0species"),
               textOutput("text1var"),
               textOutput("text2bin"),
               textOutput("text3colour"),
               plotOutput("distPlot")
             )
           )),
  tabPanel("About",
           mainPanel(includeMarkdown("about.md")))
))
