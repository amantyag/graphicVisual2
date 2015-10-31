library(shiny)
library(ggplot2)
poison <- c("Alcohol", "Marijuana", "Cocaine", 
            "Crack", "Heroin","Hallucinogen", "Inhalant",
            "Pain Reliever", "Oxytocin", "Tranquilizer", 
            "Stimulant","Meth","Sedative")

value_list_frequency<-c("alcohol", "marijuana", "cocaine", 
                         "crack", "heroin","hallucinogen", "inhalant",
                         "pain.releiver", "oxycontin", "tranquilizer", 
                         "stimulant","meth","sedative"
                        )
temp_list <- setNames(as.list(value_list_frequency), poison)
# Load dataset
data_input <- read.csv("data.csv")
shinyServer(function(input, output) { 
    output$lineplot <- renderPlot({
        # Draw the scatterplot for the specified data subset
        
        if (input$choice == 'Median number of times')
        {
          
                ggplot(data = data_input, aes_string(x = "age", 
                    y = paste(toString(temp_list[input$input_select]),".frequency", sep = "")))+
                    geom_line(color = "blue")+
                    geom_point(color = "red", size = 5)+
                    xlab("Age")+
                    ylab(paste(input$choice," "))+
                    ggtitle(paste(input$choice,"a user in an age group used",input$input_select, "in past 12 months"))           
        }
        else if( input$choice == 'Percentage of those in an age group')
        {
                ggplot(data = data_input, aes_string(x = "age", 
                    y = paste(toString(temp_list[input$input_select]),".use", sep = "")))+
                    geom_line(color = "blue")+
                    geom_point(color = "red", size = 5)+
                    xlab("Age")+
                    ylab(paste(input$choice," "))+
                    ggtitle(paste(input$choice,"who used",input$input_select, "in the past 12 months"))
           
            
        }
    })
    output$info <- renderText({
        paste0("Age = ", round(as.numeric(input$plot_click$x), digits = 1), "\n",input$choice, 
              " = " ,round(as.numeric(input$plot_click$y), digits = 1))
    })
})