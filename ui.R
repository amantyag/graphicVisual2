library(shiny)
poison <- c("Alcohol", "Marijuana", "Cocaine", 
            "Crack", "Heroin","Hallucinogen", "Inhalant",
            "Pain Reliever", "Oxytocin", "Tranquilizer", 
            "Stimulant","Meth","Sedative")
shinyUI(fluidPage(
    
    titlePanel("Perfectly Illegal!"),
    h3("See How Teenagers are Getting High",style = "color:#610B0B"),

    sidebarLayout(
        sidebarPanel(
            selectInput("input_select","Select alcohol or drug to see trend", poison),
            radioButtons("choice",
                         "Frequency and Percentage",
                         c("Median number of times", "Percentage of those in an age group")),
            HTML("<font size=2.3><ul>
<li>Median number of times : The number of times a teenage user used drug or alcohol in past 12 months</li>
<li>Percentage of those in an age group : The percentage of teenagers surveyed who used the drug or alcohol in past 12 months</li>
</ul></font>"),
            img(src= 'pic.jpg')
        ),    
        mainPanel(
              plotOutput("lineplot", click = "plot_click"),
            HTML("Click on the graph above to see the exact value"),
            verbatimTextOutput("info"),
            HTML("<ul>
                     <li>Percentage usage of Meth is lowest but the frequency is highest among all age groups 
suggesting that Meth is most addictive among teenagers.</li>
                     <li>Alcohol remains the most popular choice with Marijuana coming second.</li>
                     <li>Use of hard drugs such as Coke, Meth, Crack, Cocaine etc. gradually increases with age.</li>
                     </ul>"),
            HTML("<font size=2>Data Borrowed from <a href='http://www.icpsr.umich.edu/icpsrweb/content/SAMHDA/index.html'> National Survey on Drug Use and Health from the Substance Abuse and Mental Health Data Archive</a></font>")
        )
    )
))