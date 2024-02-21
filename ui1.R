# Dashboard UI
ui <- dashboardPage(
  
  dashboardHeader(
    title = "Statewise number of Still Births- 2009-10 to 2012-13",
    titleWidth = 650, 
    tags$li(class = "dropdown", tags$a(href = "https://www.linkedin.com/in/panchagnula-pooja-bharadwaj/", icon("linkedin"), "My Profile", target = "_blank")),
    tags$li(class = "dropdown", tags$a(href = "https://github.com/PanchagnulaPoojaBharadwaj/StillBirths_Dashboard", icon("github"), "Source code and Report", target = "_blank"))
  ),
  dashboardSidebar(
    sidebarMenu(
      id = "sidebar",
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "Visualization", tabName = "viz", icon = icon("chart-line")),
      menuItem(text = "Analysis", tabName = "anova", icon = icon("chart-line")),
      selectInput(inputId = "var1", label = "Select the Crime", choices = choices1, selected = "Rape - 2015")
    )
  ),
  
  dashboardBody(
    tabItems(
      #First tab item
      tabItem(tabName = "data",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("Stillbirth, the tragic loss of a fetus in the womb after the 20th week of pregnancy, represents a multifaceted challenge influenced by factors like maternal health, fetal development, and pregnancy complications. Causes range from maternal conditions (such as hypertension, diabetes) to fetal growth restrictions, infections, and placental issues. Tracking stillbirth data is crucial for research and public health efforts, allowing for trend identification and risk factor analysis.")),
                                column(width = 4, tags$br() ,
                                       tags$p("Abbrevations used are (NA) Not Applicable")
                                )
                              )  
                              
                     ),
                     tabPanel("Data",dataTableOutput("dataT")),
                     tabPanel("Structure",verbatimTextOutput("structure")),
                     tabPanel("Summary",verbatimTextOutput("summary")))),
      tabItem(tabName = "viz",
              #tab box
              tabBox(id = "t1", width = 12,
                     tabPanel("Statewise number of Still Births",value = "trends", plotlyOutput("bar")),
                     tabPanel("Distribution", value = "distro",plotlyOutput("histplot")))),
      tabItem(tabName = "anova",
              tabBox(id = "t1", width = 12,
                     tabPanel("About",
                              fluidRow(
                                column(width = 8,
                                       tags$br() , 
                                       tags$a("This part of Dashboard compares Statewise number of Still Births- 2009-10 to 2012-13 using test of Anova")),
                                column(width = 4, tags$br())
                     
                     )),
                     tabPanel("CR", verbatimTextOutput("CR")),
                     tabPanel("CCS", verbatimTextOutput("CCS")),
                     tabPanel("CON", verbatimTextOutput("CON")),
                     tabPanel("PAR", verbatimTextOutput("PAR")),
                     tabPanel("PCS", verbatimTextOutput("PCS")),
                     tabPanel("PCV", verbatimTextOutput("PCV"))
    )
    
  )
)))
