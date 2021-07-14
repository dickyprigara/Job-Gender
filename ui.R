library(shiny)
library(shinydashboard)
# Define UI for application that draws a histogram

shinyUI(
        
        dashboardPage(skin = "black",
            dashboardHeader(title = "Job Gender"),
            dashboardSidebar(
                sidebarMenu(
                    menuItem("Dashboard", tabName = "menu1", icon = icon("dashboard")),
                    menuItem("Data", tabName = "menu2", icon = icon("th")),
                    menuItem("Year",tabName = "menu3",icon = icon("th"))
                )
            ),
            dashboardBody(
                tabItems(
                    tabItem(tabName = "menu1",
                            fluidRow(
                              valueBox(
                                value = workers_clean$occupation %>% 
                                         unique() %>% 
                                         length(),
                                       subtitle = "Total of Occupations" , 
                                       icon = icon("address-card")
                              ),
                              valueBox(
                                value = workers_clean$major_category %>% 
                                  unique() %>% 
                                  length(),
                                subtitle = "Total of Major Category",
                                icon =icon("address-card"),
                                color = "lime"
                              ),
                              valueBox(
                                value = workers_clean$minor_category %>% 
                                  unique() %>% 
                                  length(),
                                subtitle = "Total of Minor Category",
                                icon =icon("address-card"),
                                color = "orange"
                              )
                            ),
                            fluidRow(
                                box(
                                    selectInput(inputId = "major1",
                                                label = "Major Category",
                                                choices = unique(workers_clean$major_category))
                                )
                            ),
                            fluidRow(
                                box(
                                    plotlyOutput("visual1")
                                ),
                                box(
                                    plotlyOutput("visual2")
                                )
                            )
                            ),
                    tabItem(tabName = "menu2",
                            h2("Data Workers"),
                            fluidRow(
                                box(width = 12,
                            dataTableOutput(outputId = "data"))
                            )
                            ),
                    tabItem(tabName = "menu3",
                            fluidRow(
                              box(
                                selectInput(inputId = "year",
                                            label = "Plot by Year",
                                            choices = unique(workers_clean$year)
                                  
                                )
                              )
                            ),
                            fluidRow(
                              box(
                                plotlyOutput("visual3")
                              )
                            )
                            )
                )
            )
        )
)
