# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



ui <- shinyUI(
	navbarPage("FELCI",
	   tabPanel("<Chemical", uiOutput('page1')),
	   tabPanel("<Values>", uiOutput('page2')),
	   tabPanel("<Distributions>", uiOutput('page3')),
	   tabPanel("<Costs>", uiOutput('page4')),
	   tabPanel("<BA Level>", uiOutput('page5')),
	   tabPanel("<Budget>", uiOutput('page6')),		
	   tabPanel("<Run>", uiOutput('page7'))		 
	   )
    )