library(shiny)
library(ggvis)
library(dplyr)

# Upload data from a .csv file to a dataframe
# Data has been cleansed prior to be uplaoded
UFCDataAll <- read.csv("UFC.csv")


shinyServer(function(input, output, session) {
  
  # Function for generating tooltip text
  UFC_tooltip <- function(x) {  
    if (is.null(x)) return(NULL)
    if (is.null(x$ID)) return(NULL)
  
    # Pick out the fighter with this given ID
    fighter <- UFCDataAll[UFCDataAll$ID == x$ID, ]
    paste0("<b>", fighter$Name, 
           "</b><br>", fighter$Nickname, 
           "</b><br>", fighter$WeightClass,
           "<br>","K$ ", format(fighter$CareerEarnings, big.mark = ",", scientific = FALSE)
    )
  }

  # ggvis plot + filter
  vis <- reactive({
    
    UFCDataAll %>%  
      ggvis(~WinPercentage, ~CareerEarnings) %>%
      filter(Gender == input$gender,
             Country == input$country,
             WinPercentage >= input$winpercent[1]/100,
             WinPercentage <= input$winpercent[2]/100,
             CareerEarnings >= input$earnings[1]) %>%
      layer_points(size := 50, size.hover := 200,
                   fillOpacity := 0.2, fillOpacity.hover := 0.5,
                   stroke = ~CurrentChampion, key := ~ID) %>%
      add_tooltip(UFC_tooltip, "hover") %>%
      add_axis("x", title = "Win Percentage") %>%
      add_axis("y", title = "Career Earnings - K$") %>%
      set_options(width = 1000, height = 800)
  })
  
  vis %>% bind_shiny("UFCPlot")
  
})