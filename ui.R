library(shiny)

shinyUI(fluidPage(
    titlePanel("Predict Stopping Distance of a Car"),
    sidebarLayout(
        sidebarPanel(
            p("This Shiny App gives prediction of stopping distance of a car driving at a specific speed."),
            p("Use the slider to choose the speed of the car, and this will present the predictions
            made by two different models."),
            p("Also you can choose whether to show the model fitting by checking the checkboxes."),
            sliderInput("sliderSpeed", "What is the speed of the car?", 5, 30, value = 15),
            checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
            checkboxInput("showModel2", "Show/Hide Model 2", value = TRUE)
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Stopping Distance from Model 1:"),
            textOutput("pred1"),
            h3("Predicted Stopping Distance from Model 2:"),
            textOutput("pred2")
        )
    )

)

)

