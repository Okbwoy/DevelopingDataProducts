library(shiny)
library(ggvis)
library(dplyr)

# Define the overall UI

shinyUI(pageWithSidebar(
  
  # Name of the Panel
  headerPanel("UFC Fighters Explorer"),
  
  sidebarPanel(
        
        ## Add Documentation
        h5("The objective of this aplication is to help one browsing througth the list of current, and recently retired UFC fighters,",
          "in order to identify the most successful fighters. Criteria include Career Earnings (in thousands of US$) and Career Win Percentage, but also",
          "who is the current champion in each Weight Class."),
        
        ## Add break
        tags$br(),
        
        h5("This data set can be filter by Gender (first radio button), Country (second drop-down list), min./max. Career Win Percentage (first slider)",
           "or min. Career Earnings (second slider). Only countries with at least 5 active or retired fighters were kept in he list, the item 'Others' ,
            include fighters from all other countries. Fighters' names and nicknames are available when hovering on the plot. Enjoy!"),
        
        ## Add break
        tags$br(),

        # Radio Button to select Gender
        radioButtons("gender", label = h4("Fighter Gender"), choices = list("Male" , "Female" ), selected = "Male"),

        # Select Box (drop-down box) to select country
        selectInput("country", label = h4("Fighter Country"), choices = list("AUS","BRA","CAN","CHN","GBR",
                                                                             "IRE","JPN","KOR","MEX","POL",
                                                                             "RUS","SWE","USA", "Other")
                    , selected = "USA"),
      
        # Slider Range to select Win (%)
        sliderInput("winpercent", label = h4("Fighter Win(%)"), min = 0, max = 100, value = c(40, 100)),
        
        # Slider Range to select Career Earnings
        sliderInput("earnings", label = h4("Fighter Career Earnings - K$"), min = 0, max = 1000, value = 100),
        
        ## Add break
        tags$br(),
        
        h5("NOTE: This data has been extracted from Wikipedia.",
           "Fighter list may not be the most up-to-date.",
           "Fighter Career Earnings are as of Oct. 2015."),
        
        tags$a(href="https://en.wikipedia.org/wiki/List_of_current_UFC_fighters", "Wikipedia Link")
    
        ),
  
  # Dipslay the final plot
  mainPanel(ggvisOutput("UFCPlot"))

))