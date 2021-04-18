#setwd('C:/Users/asian/OneDrive/Desktop/shiny/assignment4')
require(ggplot2)
require(data.table)
setwd("~/")
bacteria<-data.table(well=c('100/01-01','102/02-01','105/03-16','107/05-21','103/02-36'),
                     spud_date=c('2019-01-01','2019-06-10','2020-05-07','2021-02-17','2018-07-17'),
                     bacteriaLevel=c(6,100,2550,17,3))
bacteria$spud_date<-as.Date(bacteria$spud_date, format='%Y-%m-%d')
bacteria<-as.data.table(bacteria)
ui <- fluidPage(
titlePanel("Well Sample Bacteria Levels (mg/L)"),
sidebarLayout(
        sidebarPanel('Bacteria levels in wells are measured in mg/L but a logarithmic conversion is required. 
                     A log value of 6 or greater represents wells that need to be treated with Bacteriacide',
                sliderInput("date","Select Date Range:",
                        min = as.Date("2019-01-01","%Y-%m-%d"),
                        max = Sys.Date(),
                        value=as.Date('2020-01-01'),
                        timeFormat="%Y-%m-%d"),
                selectInput(inputId = "well", 
                label = "Select Well of Interest to define Logarithmic Value", 
                choices = bacteria$well, selected = bacteria$well[1])),
        mainPanel(plotOutput("plot"),
                  plotOutput('log'))
        )
)