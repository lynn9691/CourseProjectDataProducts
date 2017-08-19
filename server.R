library(shiny)

shinyServer(function(input, output){
    cars$speed2 <- cars$speed ^2
    model1 <- lm(dist ~ speed, data = cars)
    model2 <- lm(dist ~ speed + speed2, data = cars)

    model1pred <- reactive({
        speedInput <- input$sliderSpeed
        predict(model1, newdata = data.frame(speed = speedInput))
    })

    model2pred <- reactive({
        speedInput <- input$sliderSpeed
        predict(model2, newdata = data.frame(speed = speedInput,
                                             speed2 = speedInput^2))
    })

    output$plot1 <- renderPlot({
        speedInput <- input$sliderSpeed

        plot(cars$speed, cars$dist, xlab = "Speed",
             ylab = "Stopping Distance", bty = "n", pch = 16,
             xlim = c(0, 30), ylim = c(0, 150))
        if(input$showModel1){
            abline(model1, col = "red", lwd = 2)
        }
        if (input$showModel2){
            model2lines <- predict(model2, newdata = data.frame(
                speed = 0:30, speed2 = (0:30)^2
            ))
            lines(0:30, model2lines, col = "blue", lwd = 2)
        }
        legend(20, 120, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16,
               col = c("red", "blue"), bty = "n", cex = 1.2)
        points(speedInput, model1pred(), col = "red", pch = 16, cex = 2)
        points(speedInput, model2pred(), col = "blue", pch = 16, cex = 2)
    })

    output$pred1 <- renderText({
        model1pred()
    })

    output$pred2 <- renderText({
        model2pred()
    })
})
