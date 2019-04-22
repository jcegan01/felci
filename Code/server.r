# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



server <- 

	shinyServer(function(input, output, session) {
	
		# Simulation Message
		observeEvent(input$run,{
      write.csv(gui_output(),file=paste(wdir,"Input/","VoI_Input.csv", sep = ""), row.names = FALSE)		
			Sys.sleep(1)
			stopApp() 
		})
		
		# Pages
		output$page1 <- renderUI({page1})
		output$page2 <- renderUI({page2})
		output$page3 <- renderUI({page3})
		output$page4 <- renderUI({page4})		
		output$page5 <- renderUI({page5})
		output$page6 <- renderUI({page6})
		output$page7 <- renderUI({page7})
 
		# Reactive expression to create data frame of all input values ----
		gui_output <- reactive({
		  data.frame(
		  Parameter = param[c(1,seq(3,18))],
		  
		  Distribution = as.character(c(input$p01_dist,input$p03_dist,input$p04_dist,input$p05_dist,input$p06_dist,input$p07_dist,input$p08_dist,input$p09_dist,input$p10_dist,input$p11_dist,input$p12_dist,input$p13_dist,input$p14_dist,input$p15_dist,input$p16_dist,input$p17_dist,input$p18_dist)),
		  
		  Known_Value = as.character(c(input$v01,input$v03,input$v04,input$v05,input$v06,input$v07,input$v08,input$v09,input$v10,input$v11,input$v12,input$v13,input$v14,input$v15,input$v16,input$v17,input$v18)),

		  Mean_Log = as.character(c(input$p01_meanlog,input$p03_meanlog,input$p04_meanlog,input$p05_meanlog,input$p06_meanlog,input$p07_meanlog,input$p08_meanlog,input$p09_meanlog,input$p10_meanlog,input$p11_meanlog,input$p12_meanlog,input$p13_meanlog,input$p14_meanlog,input$p15_meanlog,input$p16_meanlog,input$p17_meanlog,input$p18_meanlog)),
		  
		  Mean = as.character(c(input$p01_mean,input$p03_mean,input$p04_mean,input$p05_mean,input$p06_mean,input$p07_mean,input$p08_mean,input$p09_mean,input$p10_mean,input$p11_mean,input$p12_mean,input$p13_mean,input$p14_mean,input$p15_mean,input$p16_mean,input$p17_mean,input$p18_mean)),

		  SD_Log = as.character(c(input$p01_sdlog,input$p03_sdlog,input$p04_sdlog,input$p05_sdlog,input$p06_sdlog,input$p07_sdlog,input$p08_sdlog,input$p09_sdlog,input$p10_sdlog,input$p11_sdlog,input$p12_sdlog,input$p13_sdlog,input$p14_sdlog,input$p15_sdlog,input$p16_sdlog,input$p17_sdlog,input$p18_sdlog)),

		  SD = as.character(c(input$p01_sd,input$p03_sd,input$p04_sd,input$p05_sd,input$p06_sd,input$p07_sd,input$p08_sd,input$p09_sd,input$p10_sd,input$p11_sd,input$p12_sd,input$p13_sd,input$p14_sd,input$p15_sd,input$p16_sd,input$p17_sd,input$p18_sd)),
		  
		  Min = as.character(c(input$p01_min,input$p03_min,input$p04_min,input$p05_min,input$p06_min,input$p07_min,input$p08_min,input$p09_min,input$p10_min,input$p11_min,input$p12_min,input$p13_min,input$p14_min,input$p15_min,input$p16_min,input$p17_min,input$p18_min)),

		  Likeliest = as.character(c(input$p01_lik,input$p03_lik,input$p04_lik,input$p05_lik,input$p06_lik,input$p07_lik,input$p08_lik,input$p09_lik,input$p10_lik,input$p11_lik,input$p12_lik,input$p13_lik,input$p14_lik,input$p15_lik,input$p16_lik,input$p17_lik,input$p18_lik)),

		  Max = as.character(c(input$p01_max,input$p03_max,input$p04_max,input$p05_max,input$p06_max,input$p07_max,input$p08_max,input$p09_max,input$p10_max,input$p11_max,input$p12_max,input$p13_max,input$p14_max,input$p15_max,input$p16_max,input$p17_max,input$p18_max)),
		  
		  Cost_USD = as.character(c(input$c01,input$c03,input$c04,input$c05,input$c06,input$c07,input$c08,input$c09,input$c10,input$c11,input$c12,input$c13,input$c14,input$c15,input$c16,input$c17,input$c18)),
			
			BA_Level = as.character(c(input$ba01,input$ba03,input$ba04,input$ba05,input$ba06,input$ba07,input$ba08,input$ba09,input$ba10,input$ba11,input$ba12,input$ba13,input$ba14,input$ba15,input$ba16,input$ba17,input$ba18)),

		  Property_1 = as.character(input$ct1),
		  
		  Property_2 = as.character(input$ct2),
		  
		  Property_3 = as.character(input$ct3),
		  
		  Budget_USD = as.numeric(input$bdgt),	
		  
		  # Budget_Portolios = as.integer(input$BudgetPort),
		  
		  Simulations = as.integer(input$nsim),
		  		  
		  stringsAsFactors = FALSE)

		})

		# Show the values in an HTML table ----
		output$VoI_Input <- renderTable({
		  # require inputs exist from all preceding pages to avoid displaying error
		    # req(input$ct1,input$v01,input$p02,input$c03,input$bdgt)
			if(is.null(input$ct1)|is.null(input$v01)|is.null(input$p01_dist)|is.null(input$c01)|is.null(input$bdgt))
			return(NULL)
			gui_output()
		})

		
		# Downloadable csv of selected dataset ----		
		output$downloadData <- downloadHandler(
			filename = function() {
			  paste("VoI_Input.csv", sep = "")
			},
			content = function(file) {			
			  write.csv(gui_output(), file, row.names = FALSE)
			}
		)

		# Show text descriptions for parameters
		observeEvent(input$pshow01, {
		  showModal(modalDialog(
			title = paste0(param[01]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[01]
		  ))})
		observeEvent(input$pshow03, {
		  showModal(modalDialog(
			title = paste0(param[03]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[03]
		  ))})
		observeEvent(input$pshow04, {
		  showModal(modalDialog(
			title = paste0(param[04]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[04]
		  ))})
		observeEvent(input$pshow05, {
		  showModal(modalDialog(
			title = paste0(param[05]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[05]
		  ))})
		observeEvent(input$pshow06, {
		  showModal(modalDialog(
			title = paste0(param[06]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[06]
		  ))})
		observeEvent(input$pshow07, {
		  showModal(modalDialog(
			title = paste0(param[07]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[07]
		  ))})
		observeEvent(input$pshow08, {
		  showModal(modalDialog(
			title = paste0(param[08]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[08]
		  ))})
		observeEvent(input$pshow09, {
		  showModal(modalDialog(
			title = paste0(param[09]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[09]
		  ))})
		observeEvent(input$pshow10, {
		  showModal(modalDialog(
			title = paste0(param[10]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[10]
		  ))})
		observeEvent(input$pshow11, {
		  showModal(modalDialog(
			title = paste0(param[11]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[11]
		  ))})
		observeEvent(input$pshow12, {
		  showModal(modalDialog(
			title = paste0(param[12]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[12]
		  ))})
		observeEvent(input$pshow13, {
		  showModal(modalDialog(
			title = paste0(param[13]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[13]
		  ))})
		observeEvent(input$pshow14, {
		  showModal(modalDialog(
			title = paste0(param[14]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[14]
		  ))})
		observeEvent(input$pshow15, {
		  showModal(modalDialog(
			title = paste0(param[15]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[15]
		  ))})
		observeEvent(input$pshow16, {
		  showModal(modalDialog(
			title = paste0(param[16]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[16]
		  ))})
		observeEvent(input$pshow17, {
		  showModal(modalDialog(
			title = paste0(param[17]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[17]
		  ))})
		observeEvent(input$pshow18, {
		  showModal(modalDialog(
			title = paste0(param[18]), easyClose = TRUE, footer = modalButton("Close"),
			param_info[18]
		  ))})	

		# Show references for default costs
		observeEvent(input$cshow01, {
		  showModal(modalDialog(
			title = paste0(param[01]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[01]
		  ))})
		observeEvent(input$cshow03, {
		  showModal(modalDialog(
			title = paste0(param[03]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[03]
		  ))})
		observeEvent(input$cshow04, {
		  showModal(modalDialog(
			title = paste0(param[04]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[04]
		  ))})
		observeEvent(input$cshow05, {
		  showModal(modalDialog(
			title = paste0(param[05]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[05]
		  ))})
		observeEvent(input$cshow06, {
		  showModal(modalDialog(
			title = paste0(param[06]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[06]
		  ))})
		observeEvent(input$cshow07, {
		  showModal(modalDialog(
			title = paste0(param[07]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[07]
		  ))})
		observeEvent(input$cshow08, {
		  showModal(modalDialog(
			title = paste0(param[08]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[08]
		  ))})
		observeEvent(input$cshow09, {
		  showModal(modalDialog(
			title = paste0(param[09]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[09]
		  ))})
		observeEvent(input$cshow10, {
		  showModal(modalDialog(
			title = paste0(param[10]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[10]
		  ))})
		observeEvent(input$cshow11, {
		  showModal(modalDialog(
			title = paste0(param[11]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[11]
		  ))})
		observeEvent(input$cshow12, {
		  showModal(modalDialog(
			title = paste0(param[12]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[12]
		  ))})
		observeEvent(input$cshow13, {
		  showModal(modalDialog(
			title = paste0(param[13]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[13]
		  ))})
		observeEvent(input$cshow14, {
		  showModal(modalDialog(
			title = paste0(param[14]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[14]
		  ))})
		observeEvent(input$cshow15, {
		  showModal(modalDialog(
			title = paste0(param[15]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[15]
		  ))})
		observeEvent(input$cshow16, {
		  showModal(modalDialog(
			title = paste0(param[16]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[16]
		  ))})
		observeEvent(input$cshow17, {
		  showModal(modalDialog(
			title = paste0(param[17]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[17]
		  ))})
		observeEvent(input$cshow18, {
		  showModal(modalDialog(
			title = paste0(param[18]), easyClose = TRUE, footer = modalButton("Close"),
			param_cost_reference[18]
		  ))})		  
 
 
# End page 
    })
# End page 	