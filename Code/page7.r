# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



page7 <- fluidPage(


	  
  # Title ----
  fluidRow(column(12, titlePanel("Run VoI Analysis:"))),

  br(),br(),

  #run button
	fluidRow(column(2,   
		# Input: Simple integer interval ----
			sliderInput("nsim", "Number of Simulations:",
				min = 0, max = 10000,value = 10))
	),

	#breaks
	# br(),br(),

	#download data
	# fluidRow(
		# column(1,downloadButton("downloadData", "1. Download Input Data"))		
	# ),		
	
	#breaks
	br(),br(),	

	fluidRow(
			column(1,actionButton("run", "Run VOI Analysis"))
		),
	
	#breaks
	br(),br(),

	
	# # Main panel for displaying outputs ----
	# mainPanel(
	# # Output: Table summarizing the values entered ----
	# tableOutput("VoI_Input")	
	# ),
	  
	#breaks
	br(),br()
	
)