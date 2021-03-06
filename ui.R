################
###### UI ######
################


ui <- fluidPage(
  #### Styling ####
  theme = "theme.css",
  
  tags$head(tags$style(HTML(
    ".progress-text {
	    color: black;
    }
	  .skin-blue .sidebar-menu>li.active>a, .skin-blue .sidebar-menu>li:hover>a {
	    background-color: #357d8c;
	  }
  "))),
  tags$head(
    tags$div(HTML(paste('<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />'))),
    tags$div(HTML(paste('<script src="http://code.jquery.com/jquery-latest.min.js"></script>'))),
    tags$div(HTML(paste('<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>'))),
    tags$head(tags$script(src = "script.js")),
    tags$style(HTML("
    	body 		    {font-family: 'Oxygen','Lato','Helvetica Neue',Helvetica,Arial,sans-serif !important;}
    	table.data  {width: 100%;}
    	h2 			    {border-bottom: 1px solid rgba(255,255,255,.5)}
    	.pathology  {background: rgba(255, 230, 0, 0.5);}
		  .location   {background: rgba(60,179,113, 0.5);}
		  .laterality {background: rgba(135,206,235, 0.5);}      
		  .negation 	{background: rgba(220,20,60, 0.5);}   
		  .imaging 	  {background: rgba(255,99,71, 0.5);}                         
    "))
  ),
  #### End of Styling ####
  
  # Application title
  titlePanel("Radiology Report Annotation Assistant"),
  tabsetPanel(
    ### APP TAB ###
    tabPanel("App",
      fluidRow(
        column(width = 3,
               h4('Select report file'),
               # Select report file
               selectInput("files", "", choices = files),
               # Select Annotation class to be highlighted
               checkboxGroupInput('radio','Select Annotation class', choices = c('Pathology' = "pathology",
                                                                                 'Anatomical Location' = "location",
                                                                                 'Laterality' = "laterality",
                                                                                 'Negation' = "negation",
                                                                                 'Imaging Technique' = "imaging"))
        ),
        # Text with findings
        column(width = 6,
               h4('Extracted findings'),
               uiOutput('text')
        ),
        # Patient info and retrieved findings
        column(width = 3,
               verticalLayout(
                 h4('Extracted patient info'),
                 tableOutput('patient'),
                 h4('Retrieved findings output'),
                 tableOutput('matchTable'),
                 actionButton('writeDB', 'Export findings')  
               )
        )
      )
    ### END OF APP TAB ###
    ),
    
    ### HELP TAB ###
    documentation_tab()
    ### END OF HELP TAB ###
  )

)
