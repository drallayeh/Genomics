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
