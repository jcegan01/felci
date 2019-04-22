# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



page6 <- fluidPage(

  # Theme = shinytheme("united"),

	# Title ----
	fluidRow(column(12, titlePanel("Total Budget for Testing:"))),

	br(),br(),

	# Grid layout with input and output definitions ----
	fluidRow(
		#column(1,selectInput("ba", "BA level:",choices = c("1", "2", "3", "4", "5"))),
		column(1,numericInput("bdgt", "Budget (USD):",NA,min = 0,max = NA))),				

	br()
	
	# Input: Select if you want to restrict to parameters that fit within budget ----
	# fluidRow(column(6,checkboxInput("BudgetPort", "Restrict testing portfolios to fit within the alloted budget (reduces computation time)", FALSE)))						

)

