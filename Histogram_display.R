#Second web app display histogram with variation of bins 

library(shiny)
library(shinythemes)
data(data1)

# Define UI for application that draws a histogram
ui <- fluidPage( 
  
  theme = shinytheme("cerulean"), # themes use in the ui
  
  navbarPage(
    "Web App in Shiny",#title of app
   
    tabPanel("Histogram", #fist link on the navbar
             sidebarLayout(
               sidebarPanel(
                sliderInput(inputId = "bins",
                            label ="Number of bins", #label of the cart
                            min= 0, #minimum value of bins
                            max= 40, #maximum value of bins
                            value = 30, #the default bins 
                            step = 2), #interval of input 
                sliderInput(inputId = "memb1",
                            label ="According to number of members", #label of the cart
                            min= 0, #minimum value of bins
                            max= 45, #maximum value of bins
                            value = 45#the default bins 
                             ),  
                tags$h3("Summary"),
                
                tags$p("maximum value :"),
                textOutput("txtout3"),
                tags$p("minimum value :"),
                textOutput("txtout4"),
                tags$p("Average value :"),
                textOutput("txtout5")
                
                
               ),
               mainPanel(
                plotOutput(outputId = "distplot") #a function which display graphs takes in parementer the outpur id displut which is a histogram
               ) #mainPanel
               
             )
             
             
            
    ), #Navbar 1, tabPanel
    tabPanel("Full Name", #fist link on the navbar
             sidebarPanel(
               tags$h3("Input Your names :"),
               textInput("txt1", "Given  Name:", ""),# enter a text
               textInput("txt2", "Surname:", ""),#enter a text 
             ),
             mainPanel(
               h1("Header 1"), 
               h4("Your full name is:"),
               verbatimTextOutput("txtout"), #txtout is generated from the server
             ) #mainPanel
    ), #Navbar 1, tabPanel
    tabPanel("Navbar 3", "This panel is intentionally left blank")
    
  )#navbarPage
  
)#FluidPAge

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$txtout <- renderText({
    paste(input$txt1, input$txt2, sep = " ")
    
  })

  output$distplot = renderPlot({#render a plot
    
    
    x <- data1$a2[data1$a2 < input$memb1] # takes the value of the a2  variable in a the data1 dataset
    x <- na.omit(x) #omit missing values like ,dont consider missing values ,values in na
    bins <- seq(min(x), max(x), length.out= input$bins + 1 )
    
    output$txtout3 <- renderText({ max(x)})
    output$txtout4 <- renderText({ min(x)})
    output$txtout5 <- renderText({ mean(x)})
    
    hist(x, breaks = bins, col ="green" , border ="black",
         xlab = "Number of member per household",
         main = "Hitogram of Number of member per household")
  })
  
}#server

# Run the application 
shinyApp(ui = ui, server = server)
