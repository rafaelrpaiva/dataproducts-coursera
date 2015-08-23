## User-interface file to build a shiny app
## Created by Rafael Paiva
## rafaelpaiva at gmail.com

library(shiny)
library(rCharts)

shinyUI(
    navbarPage("Brazilian Mortality Analysis by ICD",
               tabPanel("Program",
                        sidebarPanel(
                            sliderInput("period", 
                                        "Period of Time:", 
                                        min = 2008, 
                                        max = 2013, 
                                        value = c(2008, 2013)
                            )
                        ),
                        
                        mainPanel(
                            tabsetPanel(
                                # Data by state
                                tabPanel(p(icon("map-marker"), "Graphics in a map")#,
                                    #plotOutput("populationImpactByState"),
                                    #plotOutput("economicImpactByState")
                                ),
                                
                                # Time series data
                                tabPanel(p(icon("line-chart"), "Graphics of Evolution"),
                                         h4('Number of events by year', align = "center")#,
                                         #showOutput("eventsByYear", "nvd3"),
                                ),
                                
                                
                                # Data 
                                tabPanel(p(icon("table"), "View Data"),
                                         dataTableOutput(outputId="table"),
                                         downloadButton('downloadData', 'Download')
                                )
                            )
                        )
                        
               ),
               tabPanel("Help",
                        mainPanel(
                            #includeMarkdown("help.md")
                        )
               ),
               tabPanel("About",
                        mainPanel(
                            #includeMarkdown("include.md")
                        )
               )
    )
)