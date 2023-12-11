
 #Firsts display app in shiny 

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
ui <- fluidPage( 
  
    theme = shinytheme("cerulean"), # themes use in the ui
    
   navbarPage(
     "MY first app",#title of app
     tabPanel("Navbar 1", #fist link on the navabr
              sidebarPanel(
                tags$h3("input:"),
                textInput("txt1", "Given  Name:", ""),# enter a text
                textInput("txt2", "Surname:", ""),#enter a text 
              ),
              mainPanel(
                 h1("Header 1"),
                 h4("output 1"),
                 verbatimTextOutput("txtout"), #txtout is generated from the server
              ) #mainPanel
     ), #Navbar 1, tabPanel
     tabPanel("Navbar 2", "This panel is intentionally left blank"),
     tabPanel("Navbar 3", "This panel is intentionally left blank")
     
   )#navbarPage
    
)#FluidPAge

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$txtout <- renderText({
    paste(input$txt1, input$txt2, sep = " ")
    
  })

}#server

# Run the application 
shinyApp(ui = ui, server = server)
