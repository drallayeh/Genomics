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
