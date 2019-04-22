# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



page1 <- fluidPage(

includeCSS("www\\mystyle.css"),

# Title ----
fluidRow(column(12, titlePanel("Chemical Compound:"))),

	br(),br(),
  
  # Grid layout with input and output definitions ----
	fluidRow(column(1,
	
		# Input: Select chem property 1 ----
			selectInput("ct1", "Chem Type 1:",
				choices = c("Organic", "Inorganic"))),		
				
		column(1,  
		# Input: Select chem property 2 ----
			selectInput("ct2", "Chem Type 2:",
				choices = ph_list, selected = ph_list[4])),

		column(1,  
		# Input: Select chem property 3 ----
			conditionalPanel("input.ct1 == 'Inorganic'",
				selectInput("ct3", "Chem Type 3:",
				choices = c("Metal", "Non-metal"))))),

	br(),
	
		# Input: Select if you want to restrict to USEtox only parameters ----
			fluidRow(column(6,checkboxInput("USEtox", "Restrict the visibility of parameters to those required by USEtox to evaluate EcoCF based on the chemical compound type", TRUE)))			

# end page
)
# end page
