# server.R

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)
shinyServer(

  function(input, output) {
    
    output$map <- renderPlot({
      var <- switch (input$var,
          "Percent White" = counties$white,
          "Percent Black" = counties$black,
          "Percent Hispanic" = counties$hispanic,
          "Percent Asian" = counties$asian
      )
      
      color <- switch (input$var,
          "Percent White" = "#26b73e",
          "Percent Black" = "#2640c1",
          "Percent Hispanic" = "#e541f4",
          "Percent Asian" = "#ba2130"
      )
      
      legend.title <- switch (input$var,
          "Percent White" = "Percent White",
          "Percent Black" = "Percent Black",
          "Percent Hispanic" = "Percent Hispanic",
          "Percent Asian" = "Percent Asian"
      )
      percent_map(var = var, color = color, legend.title = legend.title, max = input$range[2], min = input$range[1])
    })
  }
)
