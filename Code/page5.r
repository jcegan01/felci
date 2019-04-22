# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



page5 <- fluidPage(

# Title ----
	fluidRow(column(12, titlePanel("BA Level for Unknowns:"))),

	br(),br(),

# BA level
	#01	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p01),
			h5(tags$b(paste0(param[01])))))),	
		column(1,conditionalPanel(paste(dlogic.p01),
			numericInput("ba01", label = NULL, value = param_ba_level[01],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p01),
			 h5("BA Level", align = "left")))
			),

	#03	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p03),
			h5(tags$b(paste0(param[03])))))),	
		column(1,conditionalPanel(paste(dlogic.p03),
			numericInput("ba03", label = NULL, value = param_ba_level[03],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p03),
			 h5("BA Level", align = "left")))
			),	
			
	#04	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p04),
			h5(tags$b(paste0(param[04])))))),	
		column(1,conditionalPanel(paste(dlogic.p04),
			numericInput("ba04", label = NULL, value = param_ba_level[04],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p04),
			 h5("BA Level", align = "left")))
			),	
	
	#05	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p05),
			h5(tags$b(paste0(param[05])))))),	
		column(1,conditionalPanel(paste(dlogic.p05),
			numericInput("ba05", label = NULL, value = param_ba_level[05],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p05),
			 h5("BA Level", align = "left")))
			),	
	
	#06	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p06),
			h5(tags$b(paste0(param[06])))))),	
		column(1,conditionalPanel(paste(dlogic.p06),
			numericInput("ba06", label = NULL, value = param_ba_level[06],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p06),
			 h5("BA Level", align = "left")))
			),	
					
	#07	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p07),
			h5(tags$b(paste0(param[07])))))),	
		column(1,conditionalPanel(paste(dlogic.p07),
			numericInput("ba07", label = NULL, value = param_ba_level[07],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p07),
			 h5("BA Level", align = "left")))
			),	
					
	#08	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p08),
			h5(tags$b(paste0(param[08])))))),	
		column(1,conditionalPanel(paste(dlogic.p08),
			numericInput("ba08", label = NULL, value = param_ba_level[08],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p08),
			 h5("BA Level", align = "left")))
			),	
					
	#09	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p09),
			h5(tags$b(paste0(param[09])))))),	
		column(1,conditionalPanel(paste(dlogic.p09),
			numericInput("ba09", label = NULL, value = param_ba_level[09],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p09),
			 h5("BA Level", align = "left")))
			),	
					
	#10	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p10),
			h5(tags$b(paste0(param[10])))))),	
		column(1,conditionalPanel(paste(dlogic.p10),
			numericInput("ba10", label = NULL, value = param_ba_level[10],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p10),
			 h5("BA Level", align = "left")))
			),	
					
	#11	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p11),
			h5(tags$b(paste0(param[11])))))),	
		column(1,conditionalPanel(paste(dlogic.p11),
			numericInput("ba11", label = NULL, value = param_ba_level[11],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p11),
			 h5("BA Level", align = "left")))
			),	
					
	#12	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p12),
			h5(tags$b(paste0(param[12])))))),	
		column(1,conditionalPanel(paste(dlogic.p12),
			numericInput("ba12", label = NULL, value = param_ba_level[12],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p12),
			 h5("BA Level", align = "left")))
			),	
					
	#13	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p13),
			h5(tags$b(paste0(param[13])))))),	
		column(1,conditionalPanel(paste(dlogic.p13),
			numericInput("ba13", label = NULL, value = param_ba_level[13],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p13),
			 h5("BA Level", align = "left")))
			),	
					
	#14	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p14),
			h5(tags$b(paste0(param[14])))))),	
		column(1,conditionalPanel(paste(dlogic.p14),
			numericInput("ba14", label = NULL, value = param_ba_level[14],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p14),
			 h5("BA Level", align = "left")))
			),	
					
	#15	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p15),
			h5(tags$b(paste0(param[15])))))),	
		column(1,conditionalPanel(paste(dlogic.p15),
			numericInput("ba15", label = NULL, value = param_ba_level[15],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p15),
			 h5("BA Level", align = "left")))
			),	
					
	#16	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p16),
			h5(tags$b(paste0(param[16])))))),	
		column(1,conditionalPanel(paste(dlogic.p16),
			numericInput("ba16", label = NULL, value = param_ba_level[16],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p16),
			 h5("BA Level", align = "left")))
			),	
					
	#17	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p17),
			h5(tags$b(paste0(param[17])))))),	
		column(1,conditionalPanel(paste(dlogic.p17),
			numericInput("ba17", label = NULL, value = param_ba_level[17],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p17),
			 h5("BA Level", align = "left")))
			),	
					
	#18	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p18),
			h5(tags$b(paste0(param[18])))))),	
		column(1,conditionalPanel(paste(dlogic.p18),
			numericInput("ba18", label = NULL, value = param_ba_level[18],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p18),
			 h5("BA Level", align = "left")))
			)	
	

#end page	
)
#end page