require(ggplot2)
require(data.table)
bacteria<-data.table(well=c('100/01-01','102/02-01','105/03-16','107/05-21','103/02-36'),
                     spud_date=c('2019-01-01','2019-06-10','2020-05-07','2021-02-17','2018-07-17'),
                     bacteriaLevel=c(6,100,2550,17,3))
bacteria$spud_date<-as.Date(bacteria$spud_date, format='%Y-%m-%d')
bacteria<-as.data.table(bacteria)
server <- function(input, output) {
        output$plot<-renderPlot({
                ggplot(data=bacteria[spud_date <= max(input$date),],aes(x=well,y=bacteriaLevel))+
                        geom_bar(fill='red', stat='identity')+
                        ggtitle('Bacteria Level (mg/L)')},
                height = 250,width = 500)
        
        output$log<-renderPlot({
                ggplot(data=bacteria[well==input$well,],aes(x=well,y=log(bacteriaLevel)))+
                        geom_bar(fill='green', stat='identity')+
                        ggtitle('Log Bacteria Level')},
                height = 250,width = 500)
}
            
        
     