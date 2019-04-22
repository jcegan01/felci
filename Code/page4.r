# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



page4 <- fluidPage(

# Title ----
	fluidRow(column(12, titlePanel("Estimated Testing Costs for Unknowns:"))),

	br(),br(),

# COSTS
	#01	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p01),
			h5(tags$b(paste0(param[01])))))),	
		column(1,conditionalPanel(paste(dlogic.p01),
			numericInput("c01", label = NULL, value = param_costs[01],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p01),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p01), 
			actionLink("cshow01", h5(tags$b("reference"))))))
			),

	#03	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p03),
			h5(tags$b(paste0(param[03])))))),	
		column(1,conditionalPanel(paste(dlogic.p03),
			numericInput("c03", label = NULL, value = param_costs[03],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p03),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p03), 
			actionLink("cshow03", h5(tags$b("reference"))))))
			),	
			
	#04	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p04),
			h5(tags$b(paste0(param[04])))))),	
		column(1,conditionalPanel(paste(dlogic.p04),
			numericInput("c04", label = NULL, value = param_costs[04],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p04),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p04), 
			actionLink("cshow04", h5(tags$b("reference"))))))
			),	
	
	#05	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p05),
			h5(tags$b(paste0(param[05])))))),	
		column(1,conditionalPanel(paste(dlogic.p05),
			numericInput("c05", label = NULL, value = param_costs[05],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p05),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p05), 
			actionLink("cshow05", h5(tags$b("reference"))))))
			),	
	
	#06	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p06),
			h5(tags$b(paste0(param[06])))))),	
		column(1,conditionalPanel(paste(dlogic.p06),
			numericInput("c06", label = NULL, value = param_costs[06],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p06),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p06), 
			actionLink("cshow06", h5(tags$b("reference"))))))
			),	
					
	#07	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p07),
			h5(tags$b(paste0(param[07])))))),	
		column(1,conditionalPanel(paste(dlogic.p07),
			numericInput("c07", label = NULL, value = param_costs[07],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p07),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p07), 
			actionLink("cshow07", h5(tags$b("reference"))))))
			),	
					
	#08	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p08),
			h5(tags$b(paste0(param[08])))))),	
		column(1,conditionalPanel(paste(dlogic.p08),
			numericInput("c08", label = NULL, value = param_costs[08],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p08),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p08), 
			actionLink("cshow08", h5(tags$b("reference"))))))
			),	
					
	#09	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p09),
			h5(tags$b(paste0(param[09])))))),	
		column(1,conditionalPanel(paste(dlogic.p09),
			numericInput("c09", label = NULL, value = param_costs[09],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p09),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p09), 
			actionLink("cshow09", h5(tags$b("reference"))))))
			),	
					
	#10	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p10),
			h5(tags$b(paste0(param[10])))))),	
		column(1,conditionalPanel(paste(dlogic.p10),
			numericInput("c10", label = NULL, value = param_costs[10],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p10),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p10), 
			actionLink("cshow10", h5(tags$b("reference"))))))
			),	
					
	#11	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p11),
			h5(tags$b(paste0(param[11])))))),	
		column(1,conditionalPanel(paste(dlogic.p11),
			numericInput("c11", label = NULL, value = param_costs[11],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p11),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p11), 
			actionLink("cshow11", h5(tags$b("reference"))))))
			),	
					
	#12	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p12),
			h5(tags$b(paste0(param[12])))))),	
		column(1,conditionalPanel(paste(dlogic.p12),
			numericInput("c12", label = NULL, value = param_costs[12],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p12),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p12), 
			actionLink("cshow12", h5(tags$b("reference"))))))
			),	
					
	#13	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p13),
			h5(tags$b(paste0(param[13])))))),	
		column(1,conditionalPanel(paste(dlogic.p13),
			numericInput("c13", label = NULL, value = param_costs[13],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p13),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p13), 
			actionLink("cshow13", h5(tags$b("reference"))))))
			),	
					
	#14	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p14),
			h5(tags$b(paste0(param[14])))))),	
		column(1,conditionalPanel(paste(dlogic.p14),
			numericInput("c14", label = NULL, value = param_costs[14],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p14),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p14), 
			actionLink("cshow14", h5(tags$b("reference"))))))
			),	
					
	#15	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p15),
			h5(tags$b(paste0(param[15])))))),	
		column(1,conditionalPanel(paste(dlogic.p15),
			numericInput("c15", label = NULL, value = param_costs[15],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p15),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p15), 
			actionLink("cshow15", h5(tags$b("reference"))))))
			),	
					
	#16	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p16),
			h5(tags$b(paste0(param[16])))))),	
		column(1,conditionalPanel(paste(dlogic.p16),
			numericInput("c16", label = NULL, value = param_costs[16],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p16),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p16), 
			actionLink("cshow16", h5(tags$b("reference"))))))
			),	
					
	#17	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p17),
			h5(tags$b(paste0(param[17])))))),	
		column(1,conditionalPanel(paste(dlogic.p17),
			numericInput("c17", label = NULL, value = param_costs[17],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p17),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p17), 
			actionLink("cshow17", h5(tags$b("reference"))))))
			),	
					
	#18	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(dlogic.p18),
			h5(tags$b(paste0(param[18])))))),	
		column(1,conditionalPanel(paste(dlogic.p18),
			numericInput("c18", label = NULL, value = param_costs[18],min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(dlogic.p18),
			 h5("USD", align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(dlogic.p18), 
			actionLink("cshow18", h5(tags$b("reference"))))))
			)	
	

#end page	
)
#end page