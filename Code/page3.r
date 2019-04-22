# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



page3 <- fluidPage(

# Title ----
	fluidRow(column(12, titlePanel("Estimated Distributions for Unknown Parameters:"))),

	br(),br(),
	
	#notes for troubleshooting
	#paste() in conditional statements seem to cause problems
	#statement "== null" for values on previous pages do no register. will try checkboxes
	#need to cycle through input tab before condition will recognize
	#cannot have two inputs with the same name


	# 01 - Conditional Panel
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p01),
			selectInput("p01_dist", paste(param[01],dtext),choices = distro_list, selected = distro$Distribution[01]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p01," & input.p01_dist == 'Lognormal'"),
			numericInput("p01_meanlog", "Mean Log:",distro$Meanlog[01],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p01," & input.p01_dist == 'Normal'"),
			numericInput("p01_mean", "Mean:",distro$Mean[01],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p01," & (input.p01_dist == 'Triangular' | input.p01_dist == 'Uniform')"),
			numericInput("p01_min", "Min:",distro$Min[01],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p01," & input.p01_dist == 'Lognormal'"),
			numericInput("p01_sdlog", "Std Dev Log:",distro$SDlog[01],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p01," & input.p01_dist == 'Normal'"),
			numericInput("p01_sd", "Std Dev:",distro$SD[01],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p01," & (input.p01_dist == 'Triangular' | input.p01_dist == 'Uniform')"),
			numericInput("p01_max", "Max:",distro$Max[01],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p01," & input.p01_dist == 'Triangular'"),
			numericInput("p01_lik", "Mode:",distro$Mode[01],min = NA,max = NA)))
					
	),
	
	# 03 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p03),
			selectInput("p03_dist", paste(param[03],dtext),choices = distro_list, selected = distro$Distribution[03]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p03," & input.p03_dist == 'Lognormal'"),
			numericInput("p03_meanlog", "Mean Log:",distro$Meanlog[03],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p03," & input.p03_dist == 'Normal'"),
			numericInput("p03_mean", "Mean:",distro$Mean[03],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p03," & (input.p03_dist == 'Triangular' | input.p03_dist == 'Uniform')"),
			numericInput("p03_min", "Min:",distro$Min[03],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p03," & input.p03_dist == 'Lognormal'"),
			numericInput("p03_sdlog", "Std Dev Log:",distro$SDlog[03],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p03," & input.p03_dist == 'Normal'"),
			numericInput("p03_sd", "Std Dev:",distro$SD[03],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p03," & (input.p03_dist == 'Triangular' | input.p03_dist == 'Uniform')"),
			numericInput("p03_max", "Max:",distro$Max[03],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p03," & input.p03_dist == 'Triangular'"),
			numericInput("p03_lik", "Mode:",distro$Mode[03],min = NA,max = NA)))
					
	),
	
	# 04 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p04),
			selectInput("p04_dist", paste(param[04],dtext),choices = distro_list, selected = distro$Distribution[04]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p04," & input.p04_dist == 'Lognormal'"),
			numericInput("p04_meanlog", "Mean Log:",distro$Meanlog[04],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p04," & input.p04_dist == 'Normal'"),
			numericInput("p04_mean", "Mean:",distro$Mean[04],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p04," & (input.p04_dist == 'Triangular' | input.p04_dist == 'Uniform')"),
			numericInput("p04_min", "Min:",distro$Min[04],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p04," & input.p04_dist == 'Lognormal'"),
			numericInput("p04_sdlog", "Std Dev Log:",distro$SDlog[04],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p04," & input.p04_dist == 'Normal'"),
			numericInput("p04_sd", "Std Dev:",distro$SD[04],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p04," & (input.p04_dist == 'Triangular' | input.p04_dist == 'Uniform')"),
			numericInput("p04_max", "Max:",distro$Max[04],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p04," & input.p04_dist == 'Triangular'"),
			numericInput("p04_lik", "Mode:",distro$Mode[04],min = NA,max = NA)))
					
	),
	
	# 05 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p05),
			selectInput("p05_dist", paste(param[05],dtext),choices = distro_list, selected = distro$Distribution[05]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p05," & input.p05_dist == 'Lognormal'"),
			numericInput("p05_meanlog", "Mean Log:",distro$Meanlog[05],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p05," & input.p05_dist == 'Normal'"),
			numericInput("p05_mean", "Mean:",distro$Mean[05],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p05," & (input.p05_dist == 'Triangular' | input.p05_dist == 'Uniform')"),
			numericInput("p05_min", "Min:",distro$Min[05],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p05," & input.p05_dist == 'Lognormal'"),
			numericInput("p05_sdlog", "Std Dev Log:",distro$SDlog[05],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p05," & input.p05_dist == 'Normal'"),
			numericInput("p05_sd", "Std Dev:",distro$SD[05],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p05," & (input.p05_dist == 'Triangular' | input.p05_dist == 'Uniform')"),
			numericInput("p05_max", "Max:",distro$Max[05],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p05," & input.p05_dist == 'Triangular'"),
			numericInput("p05_lik", "Mode:",distro$Mode[05],min = NA,max = NA)))
					
	),
	
	# 06 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p06),
			selectInput("p06_dist", paste(param[06],dtext),choices = distro_list, selected = distro$Distribution[06]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p06," & input.p06_dist == 'Lognormal'"),
			numericInput("p06_meanlog", "Mean Log:",distro$Meanlog[06],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p06," & input.p06_dist == 'Normal'"),
			numericInput("p06_mean", "Mean:",distro$Mean[06],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p06," & (input.p06_dist == 'Triangular' | input.p06_dist == 'Uniform')"),
			numericInput("p06_min", "Min:",distro$Min[06],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p06," & input.p06_dist == 'Lognormal'"),
			numericInput("p06_sdlog", "Std Dev Log:",distro$SDlog[06],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p06," & input.p06_dist == 'Normal'"),
			numericInput("p06_sd", "Std Dev:",distro$SD[06],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p06," & (input.p06_dist == 'Triangular' | input.p06_dist == 'Uniform')"),
			numericInput("p06_max", "Max:",distro$Max[06],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p06," & input.p06_dist == 'Triangular'"),
			numericInput("p06_lik", "Mode:",distro$Mode[06],min = NA,max = NA)))
					
	),
	
	# 07 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p07),
			selectInput("p07_dist", paste(param[07],dtext),choices = distro_list, selected = distro$Distribution[07]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p07," & input.p07_dist == 'Lognormal'"),
			numericInput("p07_meanlog", "Mean Log:",distro$Meanlog[07],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p07," & input.p07_dist == 'Normal'"),
			numericInput("p07_mean", "Mean:",distro$Mean[07],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p07," & (input.p07_dist == 'Triangular' | input.p07_dist == 'Uniform')"),
			numericInput("p07_min", "Min:",distro$Min[07],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p07," & input.p07_dist == 'Lognormal'"),
			numericInput("p07_sdlog", "Std Dev Log:",distro$SDlog[07],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p07," & input.p07_dist == 'Normal'"),
			numericInput("p07_sd", "Std Dev:",distro$SD[07],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p07," & (input.p07_dist == 'Triangular' | input.p07_dist == 'Uniform')"),
			numericInput("p07_max", "Max:",distro$Max[07],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p07," & input.p07_dist == 'Triangular'"),
			numericInput("p07_lik", "Mode:",distro$Mode[07],min = NA,max = NA)))
					
	),
	
	# 08 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p08),
			selectInput("p08_dist", paste(param[08],dtext),choices = distro_list, selected = distro$Distribution[08]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p08," & input.p08_dist == 'Lognormal'"),
			numericInput("p08_meanlog", "Mean Log:",distro$Meanlog[08],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p08," & input.p08_dist == 'Normal'"),
			numericInput("p08_mean", "Mean:",distro$Mean[08],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p08," & (input.p08_dist == 'Triangular' | input.p08_dist == 'Uniform')"),
			numericInput("p08_min", "Min:",distro$Min[08],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p08," & input.p08_dist == 'Lognormal'"),
			numericInput("p08_sdlog", "Std Dev Log:",distro$SDlog[08],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p08," & input.p08_dist == 'Normal'"),
			numericInput("p08_sd", "Std Dev:",distro$SD[08],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p08," & (input.p08_dist == 'Triangular' | input.p08_dist == 'Uniform')"),
			numericInput("p08_max", "Max:",distro$Max[08],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p08," & input.p08_dist == 'Triangular'"),
			numericInput("p08_lik", "Mode:",distro$Mode[08],min = NA,max = NA)))
					
	),
	
	# 09 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p09),
			selectInput("p09_dist", paste(param[09],dtext),choices = distro_list, selected = distro$Distribution[09]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p09," & input.p09_dist == 'Lognormal'"),
			numericInput("p09_meanlog", "Mean Log:",distro$Meanlog[09],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p09," & input.p09_dist == 'Normal'"),
			numericInput("p09_mean", "Mean:",distro$Mean[09],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p09," & (input.p09_dist == 'Triangular' | input.p09_dist == 'Uniform')"),
			numericInput("p09_min", "Min:",distro$Min[09],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p09," & input.p09_dist == 'Lognormal'"),
			numericInput("p09_sdlog", "Std Dev Log:",distro$SDlog[09],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p09," & input.p09_dist == 'Normal'"),
			numericInput("p09_sd", "Std Dev:",distro$SD[09],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p09," & (input.p09_dist == 'Triangular' | input.p09_dist == 'Uniform')"),
			numericInput("p09_max", "Max:",distro$Max[09],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p09," & input.p09_dist == 'Triangular'"),
			numericInput("p09_lik", "Mode:",distro$Mode[09],min = NA,max = NA)))
					
	),
	
	# 10 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p10),
			selectInput("p10_dist", paste(param[10],dtext),choices = distro_list, selected = distro$Distribution[10]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p10," & input.p10_dist == 'Lognormal'"),
			numericInput("p10_meanlog", "Mean Log:",distro$Meanlog[10],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p10," & input.p10_dist == 'Normal'"),
			numericInput("p10_mean", "Mean:",distro$Mean[10],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p10," & (input.p10_dist == 'Triangular' | input.p10_dist == 'Uniform')"),
			numericInput("p10_min", "Min:",distro$Min[10],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p10," & input.p10_dist == 'Lognormal'"),
			numericInput("p10_sdlog", "Std Dev Log:",distro$SDlog[10],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p10," & input.p10_dist == 'Normal'"),
			numericInput("p10_sd", "Std Dev:",distro$SD[10],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p10," & (input.p10_dist == 'Triangular' | input.p10_dist == 'Uniform')"),
			numericInput("p10_max", "Max:",distro$Max[10],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p10," & input.p10_dist == 'Triangular'"),
			numericInput("p10_lik", "Mode:",distro$Mode[10],min = NA,max = NA)))
					
	),
	
	# 11 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p11),
			selectInput("p11_dist", paste(param[11],dtext),choices = distro_list, selected = distro$Distribution[11]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p11," & input.p11_dist == 'Lognormal'"),
			numericInput("p11_meanlog", "Mean Log:",distro$Meanlog[11],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p11," & input.p11_dist == 'Normal'"),
			numericInput("p11_mean", "Mean:",distro$Mean[11],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p11," & (input.p11_dist == 'Triangular' | input.p11_dist == 'Uniform')"),
			numericInput("p11_min", "Min:",distro$Min[11],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p11," & input.p11_dist == 'Lognormal'"),
			numericInput("p11_sdlog", "Std Dev Log:",distro$SDlog[11],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p11," & input.p11_dist == 'Normal'"),
			numericInput("p11_sd", "Std Dev:",distro$SD[11],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p11," & (input.p11_dist == 'Triangular' | input.p11_dist == 'Uniform')"),
			numericInput("p11_max", "Max:",distro$Max[11],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p11," & input.p11_dist == 'Triangular'"),
			numericInput("p11_lik", "Mode:",distro$Mode[11],min = NA,max = NA)))
					
	),
	
	# 12 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p12),
			selectInput("p12_dist", paste(param[12],dtext),choices = distro_list, selected = distro$Distribution[12]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p12," & input.p12_dist == 'Lognormal'"),
			numericInput("p12_meanlog", "Mean Log:",distro$Meanlog[12],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p12," & input.p12_dist == 'Normal'"),
			numericInput("p12_mean", "Mean:",distro$Mean[12],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p12," & (input.p12_dist == 'Triangular' | input.p12_dist == 'Uniform')"),
			numericInput("p12_min", "Min:",distro$Min[12],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p12," & input.p12_dist == 'Lognormal'"),
			numericInput("p12_sdlog", "Std Dev Log:",distro$SDlog[12],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p12," & input.p12_dist == 'Normal'"),
			numericInput("p12_sd", "Std Dev:",distro$SD[12],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p12," & (input.p12_dist == 'Triangular' | input.p12_dist == 'Uniform')"),
			numericInput("p12_max", "Max:",distro$Max[12],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p12," & input.p12_dist == 'Triangular'"),
			numericInput("p12_lik", "Mode:",distro$Mode[12],min = NA,max = NA)))
					
	),
	
	# 13 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p13),
			selectInput("p13_dist", paste(param[13],dtext),choices = distro_list, selected = distro$Distribution[13]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p13," & input.p13_dist == 'Lognormal'"),
			numericInput("p13_meanlog", "Mean Log:",distro$Meanlog[13],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p13," & input.p13_dist == 'Normal'"),
			numericInput("p13_mean", "Mean:",distro$Mean[13],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p13," & (input.p13_dist == 'Triangular' | input.p13_dist == 'Uniform')"),
			numericInput("p13_min", "Min:",distro$Min[13],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p13," & input.p13_dist == 'Lognormal'"),
			numericInput("p13_sdlog", "Std Dev Log:",distro$SDlog[13],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p13," & input.p13_dist == 'Normal'"),
			numericInput("p13_sd", "Std Dev:",distro$SD[13],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p13," & (input.p13_dist == 'Triangular' | input.p13_dist == 'Uniform')"),
			numericInput("p13_max", "Max:",distro$Max[13],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p13," & input.p13_dist == 'Triangular'"),
			numericInput("p13_lik", "Mode:",distro$Mode[13],min = NA,max = NA)))
					
	),
	
	# 14 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p14),
			selectInput("p14_dist", paste(param[14],dtext),choices = distro_list, selected = distro$Distribution[14]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p14," & input.p14_dist == 'Lognormal'"),
			numericInput("p14_meanlog", "Mean Log:",distro$Meanlog[14],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p14," & input.p14_dist == 'Normal'"),
			numericInput("p14_mean", "Mean:",distro$Mean[14],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p14," & (input.p14_dist == 'Triangular' | input.p14_dist == 'Uniform')"),
			numericInput("p14_min", "Min:",distro$Min[14],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p14," & input.p14_dist == 'Lognormal'"),
			numericInput("p14_sdlog", "Std Dev Log:",distro$SDlog[14],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p14," & input.p14_dist == 'Normal'"),
			numericInput("p14_sd", "Std Dev:",distro$SD[14],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p14," & (input.p14_dist == 'Triangular' | input.p14_dist == 'Uniform')"),
			numericInput("p14_max", "Max:",distro$Max[14],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p14," & input.p14_dist == 'Triangular'"),
			numericInput("p14_lik", "Mode:",distro$Mode[14],min = NA,max = NA)))
					
	),
	
	# 15 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p15),
			selectInput("p15_dist", paste(param[15],dtext),choices = distro_list, selected = distro$Distribution[15]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p15," & input.p15_dist == 'Lognormal'"),
			numericInput("p15_meanlog", "Mean Log:",distro$Meanlog[15],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p15," & input.p15_dist == 'Normal'"),
			numericInput("p15_mean", "Mean:",distro$Mean[15],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p15," & (input.p15_dist == 'Triangular' | input.p15_dist == 'Uniform')"),
			numericInput("p15_min", "Min:",distro$Min[15],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p15," & input.p15_dist == 'Lognormal'"),
			numericInput("p15_sdlog", "Std Dev Log:",distro$SDlog[15],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p15," & input.p15_dist == 'Normal'"),
			numericInput("p15_sd", "Std Dev:",distro$SD[15],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p15," & (input.p15_dist == 'Triangular' | input.p15_dist == 'Uniform')"),
			numericInput("p15_max", "Max:",distro$Max[15],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p15," & input.p15_dist == 'Triangular'"),
			numericInput("p15_lik", "Mode:",distro$Mode[15],min = NA,max = NA)))
					
	),
	
	# 16 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p16),
			selectInput("p16_dist", paste(param[16],dtext),choices = distro_list, selected = distro$Distribution[16]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p16," & input.p16_dist == 'Lognormal'"),
			numericInput("p16_meanlog", "Mean Log:",distro$Meanlog[16],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p16," & input.p16_dist == 'Normal'"),
			numericInput("p16_mean", "Mean:",distro$Mean[16],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p16," & (input.p16_dist == 'Triangular' | input.p16_dist == 'Uniform')"),
			numericInput("p16_min", "Min:",distro$Min[16],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p16," & input.p16_dist == 'Lognormal'"),
			numericInput("p16_sdlog", "Std Dev Log:",distro$SDlog[16],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p16," & input.p16_dist == 'Normal'"),
			numericInput("p16_sd", "Std Dev:",distro$SD[16],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p16," & (input.p16_dist == 'Triangular' | input.p16_dist == 'Uniform')"),
			numericInput("p16_max", "Max:",distro$Max[16],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p16," & input.p16_dist == 'Triangular'"),
			numericInput("p16_lik", "Mode:",distro$Mode[16],min = NA,max = NA)))
					
	),
	
	# 17 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p17),
			selectInput("p17_dist", paste(param[17],dtext),choices = distro_list, selected = distro$Distribution[17]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p17," & input.p17_dist == 'Lognormal'"),
			numericInput("p17_meanlog", "Mean Log:",distro$Meanlog[17],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p17," & input.p17_dist == 'Normal'"),
			numericInput("p17_mean", "Mean:",distro$Mean[17],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p17," & (input.p17_dist == 'Triangular' | input.p17_dist == 'Uniform')"),
			numericInput("p17_min", "Min:",distro$Min[17],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p17," & input.p17_dist == 'Lognormal'"),
			numericInput("p17_sdlog", "Std Dev Log:",distro$SDlog[17],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p17," & input.p17_dist == 'Normal'"),
			numericInput("p17_sd", "Std Dev:",distro$SD[17],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p17," & (input.p17_dist == 'Triangular' | input.p17_dist == 'Uniform')"),
			numericInput("p17_max", "Max:",distro$Max[17],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p17," & input.p17_dist == 'Triangular'"),
			numericInput("p17_lik", "Mode:",distro$Mode[17],min = NA,max = NA)))
					
	),
		
	# 18 - Conditional Panel			
	fluidRow(column(2,  	
		conditionalPanel(paste0(dlogic.p18),
			selectInput("p18_dist", paste(param[18],dtext),choices = distro_list, selected = distro$Distribution[18]))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p18," & input.p18_dist == 'Lognormal'"),
			numericInput("p18_meanlog", "Mean Log:",distro$Meanlog[18],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p18," & input.p18_dist == 'Normal'"),
			numericInput("p18_mean", "Mean:",distro$Mean[18],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p18," & (input.p18_dist == 'Triangular' | input.p18_dist == 'Uniform')"),
			numericInput("p18_min", "Min:",distro$Min[18],min = NA,max = NA))),
	
		column(1,
		conditionalPanel(paste0(dlogic.p18," & input.p18_dist == 'Lognormal'"),
			numericInput("p18_sdlog", "Std Dev Log:",distro$SDlog[18],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p18," & input.p18_dist == 'Normal'"),
			numericInput("p18_sd", "Std Dev:",distro$SD[18],min = NA,max = NA)),
		conditionalPanel(paste0(dlogic.p18," & (input.p18_dist == 'Triangular' | input.p18_dist == 'Uniform')"),
			numericInput("p18_max", "Max:",distro$Max[18],min = NA,max = NA))),
			
		column(1,								
		conditionalPanel(paste0(dlogic.p18," & input.p18_dist == 'Triangular'"),
			numericInput("p18_lik", "Mode:",distro$Mode[18],min = NA,max = NA)))
					
	)
	

	
#end page	
)
#end page