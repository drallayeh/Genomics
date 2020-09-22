library(AmesHousing)

h <- make_ames()

ui <- shinyUI(fluidPage(
  titlePanel("AbdouApp"),
  sidebarLayout(
    sidebarPanel(
      h3("Control Center"),
      sliderInput("slider1", "Year", 1872, 2010, 1872)
    ),
    mainPanel(
      h3("Plot"),
      plotOutput("plot"),
      h2("House Price:"),
      textOutput("pred")
    ))
))

library(AmesHousing)
h <- make_ames()

server <- shinyServer(function(input, output) {
  
  model <- lm(Sale_Price~Year_Built, data = h)
  modpred <- reactive({
    ybinput <- input$slider1
    predict(model, newdata = data.frame(Year_Built = ybinput))
  })
  output$plot <- renderPlot({
    ybinput <- input$slider1
    plot(h$Year_Built, h$Sale_Price, xlab = "Year Built",
         ylab = "Sale Price")
    abline(model, col = "red")
    legend(25,25,c("Prediction"))
    points(ybinput, modpred())
  })
})

shinyApp(ui=ui,server=server)

