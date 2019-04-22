# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



page2 <- fluidPage(
	
# Title ----
	fluidRow(column(12, titlePanel("Known Parameters:"))),

	br(),

	fluidRow(column(12, h4(tags$i("Restricted to empirical data (not inclusive of QSAR estimates)")))),

	br(),

	# Known Values
	#01	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p01),
			h5(tags$b(paste0(param[01])))))),	
		column(1,conditionalPanel(paste(logic.p01),
			numericInput("v01", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p01),
			 h5(param_units[01], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p01), 
			actionLink("pshow01", h5(tags$b("info"))))))
			),

	#03	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p03),
			h5(tags$b(paste0(param[03])))))),	
		column(1,conditionalPanel(paste(logic.p03),
			numericInput("v03", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p03),
			 h5(param_units[03], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p03), 
			actionLink("pshow03", h5(tags$b("info"))))))
			),	
			
	#04	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p04),
			h5(tags$b(paste0(param[04])))))),	
		column(1,conditionalPanel(paste(logic.p04),
			numericInput("v04", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p04),
			 h5(param_units[04], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p04), 
			actionLink("pshow04", h5(tags$b("info"))))))
			),	
	
	#05	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p05),
			h5(tags$b(paste0(param[05])))))),	
		column(1,conditionalPanel(paste(logic.p05),
			numericInput("v05", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p05),
			 h5(param_units[05], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p05), 
			actionLink("pshow05", h5(tags$b("info"))))))
			),	
	
	#06	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p06),
			h5(tags$b(paste0(param[06])))))),	
		column(1,conditionalPanel(paste(logic.p06),
			numericInput("v06", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p06),
			 h5(param_units[06], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p06), 
			actionLink("pshow06", h5(tags$b("info"))))))
			),	
					
	#07	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p07),
			h5(tags$b(paste0(param[07])))))),	
		column(1,conditionalPanel(paste(logic.p07),
			numericInput("v07", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p07),
			 h5(param_units[07], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p07), 
			actionLink("pshow07", h5(tags$b("info"))))))
			),	
					
	#08	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p08),
			h5(tags$b(paste0(param[08])))))),	
		column(1,conditionalPanel(paste(logic.p08),
			numericInput("v08", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p08),
			 h5(param_units[08], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p08), 
			actionLink("pshow08", h5(tags$b("info"))))))
			),	
					
	#09	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p09),
			h5(tags$b(paste0(param[09])))))),	
		column(1,conditionalPanel(paste(logic.p09),
			numericInput("v09", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p09),
			 h5(param_units[09], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p09), 
			actionLink("pshow09", h5(tags$b("info"))))))
			),	
					
	#10	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p10),
			h5(tags$b(paste0(param[10])))))),	
		column(1,conditionalPanel(paste(logic.p10),
			numericInput("v10", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p10),
			 h5(param_units[10], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p10), 
			actionLink("pshow10", h5(tags$b("info"))))))
			),	
					
	#11	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p11),
			h5(tags$b(paste0(param[11])))))),	
		column(1,conditionalPanel(paste(logic.p11),
			numericInput("v11", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p11),
			 h5(param_units[11], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p11), 
			actionLink("pshow11", h5(tags$b("info"))))))
			),	
					
	#12	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p12),
			h5(tags$b(paste0(param[12])))))),	
		column(1,conditionalPanel(paste(logic.p12),
			numericInput("v12", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p12),
			 h5(param_units[12], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p12), 
			actionLink("pshow12", h5(tags$b("info"))))))
			),	
					
	#13	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p13),
			h5(tags$b(paste0(param[13])))))),	
		column(1,conditionalPanel(paste(logic.p13),
			numericInput("v13", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p13),
			 h5(param_units[13], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p13), 
			actionLink("pshow13", h5(tags$b("info"))))))
			),	
					
	#14	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p14),
			h5(tags$b(paste0(param[14])))))),	
		column(1,conditionalPanel(paste(logic.p14),
			numericInput("v14", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p14),
			 h5(param_units[14], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p14), 
			actionLink("pshow14", h5(tags$b("info"))))))
			),	
					
	#15	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p15),
			h5(tags$b(paste0(param[15])))))),	
		column(1,conditionalPanel(paste(logic.p15),
			numericInput("v15", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p15),
			 h5(param_units[15], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p15), 
			actionLink("pshow15", h5(tags$b("info"))))))
			),	
					
	#16	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p16),
			h5(tags$b(paste0(param[16])))))),	
		column(1,conditionalPanel(paste(logic.p16),
			numericInput("v16", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p16),
			 h5(param_units[16], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p16), 
			actionLink("pshow16", h5(tags$b("info"))))))
			),	
					
	#17	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p17),
			h5(tags$b(paste0(param[17])))))),	
		column(1,conditionalPanel(paste(logic.p17),
			numericInput("v17", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p17),
			 h5(param_units[17], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p17), 
			actionLink("pshow17", h5(tags$b("info"))))))
			),	
					
	#18	
	fluidRow(
		tags$b(column(1,conditionalPanel(paste(logic.p18),
			h5(tags$b(paste0(param[18])))))),	
		column(1,conditionalPanel(paste(logic.p18),
			numericInput("v18", label = NULL, value = NA,min = 0, max = NA, step = NA))),
		column(1,conditionalPanel(paste(logic.p18),
			 h5(param_units[18], align = "left"))),			
		tags$b(column(1,conditionalPanel(paste(logic.p18), 
			actionLink("pshow18", h5(tags$b("info"))))))
			)


#end page		
)
#end page