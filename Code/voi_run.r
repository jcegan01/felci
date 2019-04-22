# Project: FELCI
# Author(s): Dayton, Avi, Jeff 
# Date: 4/24/2018



################# SETUP #################	

#Start time
	start_time <- Sys.time()

#Read in data script and test logic
	setwd(paste0(wdir,"Code"))
	source("data.r")
	rules <- read.csv('Input_test_logic.csv') 
	setwd(wdir)
	
#Options
	options(stringsAsFactors = FALSE)	
	
#Directories
	inputDir <- paste(wdir, 'Input', sep='')

#Dialog box: Resume or start new run?
if (new_input == "YES" & file.exists(paste(inputDir,'/VoI_Input.csv', sep=''))){resume <- "NO"
	}else if (new_input == "NO"){resume <- "YES"
	}else {q("no")}
	
#Modify directories and variables based on user input	
	if (resume == "NO"){ #paths and chem data for new run
		saveDir <- paste(wdir,'Load_Save/', gsub(':', '-', Sys.time()), sep ='')
		resultsDir <- paste(wdir,'Results/', gsub(':', '-', Sys.time()), sep ='')		
		dir.create(saveDir)
		file.copy(paste(inputDir,'/VoI_Input.csv', sep=''), paste(saveDir,'/VoI_Input.csv', sep=''))
		unlink(paste(inputDir,'/VoI_Input.csv', sep=''), recursive=FALSE)		
  }else{ #paths and chem data for resume
		saveDir <- choose.dir()
		resultsDir <- gsub('Load_Save', 'Results', saveDir)		
		saveCountPath <- paste(saveDir, '/Resume_run_stats.csv', sep='')
		saveDataPath <- paste(saveDir, '/Resume_cumulative_error.csv', sep='')
	}
	
#Load Required Packages
	lapply(c("MASS","fitdistrplus","triangle","gtools","rPref"), require, character.only = TRUE)


################# FUNCTIONS #################	
		
#Function to configure information for USEtox ingestion
	USEtox_format <- function(tbl,column_name){		
		tout <- rep(NA,39)  
		tout[1] <- "104-11-4"
		tout[2] <- "Chem Name"			
			for (i in 1:nrow(tbl)){
				tout[as.integer(param_info[which(param_info[,1]==tbl$Parameter[i]),2])] <- tbl[i,which(colnames(tbl) == column_name)]
			} 		
		return(tout) 
	}	

#Call USEtox
	USEtox_call <- function(tbl,seconds){	
		#Set WD
			setwd(paste0(wdir,"USEtox/"))
		#Write file	
			write.table(tbl, "USESim_input.csv",na = "",row.names = FALSE,col.names = FALSE,append = FALSE,sep = ",")
		#Remove previous USEsim output files	
			if (file.exists("USESim_Output.csv")){unlink("USESim_Output.csv", recursive=FALSE)}				
		#Push to USEtox by calling import macro	
			shell.exec("FELCI_Import_Run_Macro.vbs") 
		#Wait for USESim_Output.csv file to exist	
			while (!file.exists("USESim_Output.csv")) {Sys.sleep(seconds)}	
		#Grab Ecotox CF Em.airC freshwater from USEtox outputs for true score
			Sys.sleep(1)
			tout <-  read.csv("USESim_Output.csv", header = FALSE)
	 		return(tout)
		#Set WD
			setwd(wdir)			
	}


################# CHEM TABLE MANIPULATION #################
	
#Import chem data
	chem <- read.csv(paste(saveDir, '/VoI_Input.csv', sep='')) 
	
#Add pKaChemClass the chem table
	chem <- rbind(chem,chem[1,])
	chem$Parameter[nrow(chem)] <- "pKaChemClass"
	chem$Known_Value[nrow(chem)] <- NA
	chem$Distribution[nrow(chem)] <- "Point"

#Add dummy data for costs and BA values
	# chem$Cost_USD <- seq(1:nrow(chem))*100
	# chem$BA_Level <- c(1,2,3)
	
#Assign point distributions to parameters with known values
	chem$Distribution[which(!is.na(chem$Known_Value))] <- "Point"
		
#Define the number of iterations in the Monte Carlo Simulation		
	sim <- chem$Simulations[1] 

#Chem parameter name and USEtox column xwalk
	param_info <- cbind(c("mw","pKaChemClass","pKa.gain","pKa.loss","Kow","Koc","Kh25c","Pvap25","Sol25","Kdoc","KpSS","KpSd","KpSI","kdegA","kdegW","kdegSd","kdegSI","avlogEC50"),c(seq(5,21),29))
	
#Convert string properties to numeric	
	chem$Property_1_string <- chem$Property_1
	chem$Property_2_string <- chem$Property_2
	chem$Property_1[which(chem$Property_1 == 'Inorganic')] <- 0
	chem$Property_1[which(chem$Property_1 == 'Organic')] <- 1
	chem$Property_2[which(chem$Property_2 == 'Acid')] <- 0
	chem$Property_2[which(chem$Property_2 == 'Neutral')] <- 1
	chem$Property_2[which(chem$Property_2 == 'Base')] <- 2
	chem$Property_2[which(chem$Property_2 == 'Amphoter')] <- 3

#USEtox logic
	chem$USEtox_EcoCF <- NA
	for (i in 1:nrow(param_info)){
		chem$USEtox_EcoCF[which(chem$Parameter == param_info[i,1])] <- rules[which(rules$Property_1 == chem$Property_1[1] & rules$Property_2 == chem$Property_2[1]),which(colnames(rules) == param_info[i,1])]
	}

#Retain parameters that are required by USEtox
	chem <- subset(chem, USEtox_EcoCF == 1)

#Create expected value column     
	chem$Expected_Value <- NA

#Populate all expected values and pKaChemClass known value
	X <- which(!is.na(chem$Known_Value))
		chem$Expected_Value[X] <- chem$Known_Value[X]
	X <- which(is.na(chem$Known_Value) & chem$Distribution=='Lognormal')
		chem$Expected_Value[X] <- exp(chem$Mean_Log[X])
	X <- which(is.na(chem$Known_Value) & chem$Distribution=='Normal')
		chem$Expected_Value[X] <- chem$Mean[X]
	X <- which(is.na(chem$Known_Value) & chem$Distribution=='Uniform')
		chem$Expected_Value[X] <- mean(c(chem$Min[X],chem$Max[X]))
	X <- which(is.na(chem$Known_Value) & chem$Distribution=='Triangular')
		chem$Expected_Value[X] <- mean(c(chem$Min[X], chem$Max[X], chem$Mode[X]))
	X <- which(chem$Parameter=='pKaChemClass')
		chem$Expected_Value[X] <- tolower(chem$Property_2_string[X])			
		chem$Known_Value[X] <- tolower(chem$Property_2_string[X])		

#Expected Score     
	#Create input data from simulation-specific true values
		input <- USEtox_format(chem, "Expected_Value")
		input <- t(input)

	#Grab Ecotox CF Em.airC freshwater from USEtox outputs for true score
		USESim_Output <- USEtox_call(input,1)
		expected_score <- USESim_Output[1,13]

	
################# PORTFOLIO SETUP #################	

#Create portfolio template (1=perform test, 0=dont perform test)
	dataPort <- subset(chem, is.na(chem$Known_Value))  
	port_unkown <- permutations(2,nrow(dataPort),v=c(0,1),repeats.allowed=TRUE)
	port <- matrix(NA, ncol = nrow(chem), nrow = nrow(port_unkown))

	unknownCount = 1
		for(i in 1:nrow(chem)){
	  if (is.na(chem$Known_Value[i])){
		port[,i] <- port_unkown[, unknownCount]
		unknownCount = unknownCount + 1
	  }else{
		port[,i] <- rep(0,nrow(port_unkown))
	  }
	}

#Initialize score for each portfolio
  port_score <- rep(0, nrow(port))

#Initialize simulation error for each portfolio	
  error <- rep(0, nrow(port))

#Initialize cumulative error for all simulations
	if (resume == "NO"){ 
		sim_start <- 1
		#initialize vector of cumulative error for each portfolio
		cumul_error <- rep(0, nrow(port))	
	} else{
		#load file and set parameters to continue from last saved test
		place <- unlist(read.csv(saveCountPath, header = FALSE)$V1)
		Sys.sleep(1)
		sim_start <- place[1] + 1
		sim <- place[2]
		cumul_error <- unlist(read.csv(saveDataPath, header = FALSE)$V1)
	}	

#Set up progress bar
	pb <- winProgressBar(title = paste0(round((sim_start-1)/sim*100, 0),"% done - Simulation ",sim_start," of ",sim," (calculating time remaining...)"), min = 0,max = sim, initial = sim_start, width = 300)
	
################# PORTFOLIO SIMULATIONS #################

if (sim_start <= sim){
	for (j in sim_start:sim) {

		#Update progress bar
			if (exists("j_start_time")){
				j_end_time <- Sys.time()
				j_loop_time <- difftime(j_end_time,j_start_time,units = "secs")
				time_remaining <- j_loop_time * (sim-j+1)
				setWinProgressBar(pb, j, title=paste0(round((j-1)/sim*100, 0),"% done - Simulation ",j," of ",sim," (",(ceiling(time_remaining/360)/10)," hr(s). remaining)"))
			}			
			j_start_time <- Sys.time()			
			
		#Determine true values for simulation
			chem$True_Value <- NA
			for (i in 1:nrow(chem)) {
				if (chem$Distribution[i] == 'Normal') {
					chem$True_Value[i] <- rnorm(1, mean = chem$Mean[i], sd = chem$SD[i])
				} else if (chem$Distribution[i] == 'Lognormal') { 
					chem$True_Value[i] <- rlnorm(1, meanlog = chem$Mean_Log[i], sdlog = chem$SD_Log[i])
				} else if (chem$Distribution[i] == 'Triangular') {
					chem$True_Value[i] <- rtriangle(1, a = chem$Min[i], b = chem$Max[i], c = chem$Mode[i])
				} else if (chem$Distribution[i] == 'Uniform') {
					chem$True_Value[i] <- runif(1, min = chem$Min[i], max = chem$Max[i])
				}
					else if (chem$Distribution[i] == 'Point') {
						chem$True_Value[i] <- chem$Known_Value[i]
				}
			}

		#Create input data from simulation-specific true values
			input <- USEtox_format(chem, "True_Value")
			input <- t(input)

		#Grab Ecotox CF Em.airC freshwater from USEtox outputs for true score
			USESim_Output <- USEtox_call(input,1)
			true_score <- USESim_Output[1,13]

		#Create the expected value/true value	matrix for each portfolio
			Port_Value <- matrix(rep(chem$Expected_Value, nrow(port)),nrow(port),ncol(port), byrow = TRUE)
			for (i in 1:nrow(port)) {           
				loc <- which(port[i,] == 1)                   
				Port_Value[i,loc] <- chem$True_Value[loc]    
			}

		#Create input data from simulation-specific portfolio values
			input <- matrix(data=NA, ncol=39, nrow=nrow(Port_Value))
			input[,1] <- "104-11-4"
			input[,2] <- "Chem Name"	
			for (i in 1:nrow(chem)){
				input[,as.integer(param_info[which(param_info[,1]==chem$Parameter[i]),2])] <- Port_Value[,i]
			} 

		#Call USEtox	
			if (nrow(input)>32700){
				#Create two input batches
					input1 <- input[1:30000,]
					input2 <- input[30001:nrow(input),]

				#Grab Ecotox CF Em.airC freshwater from USEtox outputs
					USESim_Output1 <- USEtox_call(input1,10)
					USESim_Output2 <- USEtox_call(input2,10)	
					USESim_Output <- rbind(USESim_Output1,USESim_Output2,header = FALSE)

			}else{
				#Grab Ecotox CF Em.airC freshwater from USEtox outputs
					USESim_Output <- USEtox_call(input,10)
			}
				
		#Portfolio scores: Endpoint Ecotox CF Em.airC freshwater    
			port_score <- USESim_Output[,13]    

		#Calculate simulation error for each porfolio   
			error <- abs(port_score - true_score)
			
		#Calculate cumulative error for each porfolio    
			prev_cumul_error <- cumul_error
			cumul_error <- (cumul_error + error)
			
		#Save statistics	
			saveCount <- c(j, sim)
			path <- paste(saveDir, '/Resume_run_stats.csv', sep = '')
				write.table(saveCount, path, na = "", col.names = FALSE, row.names = FALSE, append = FALSE, sep = ",")
			path <- paste(saveDir, '/Resume_cumulative_error.csv', sep = '')
				write.table(cumul_error, path, na = "", col.names = FALSE, row.names = FALSE, append = FALSE, sep = ",")

			port_rank <- t(rank(cumul_error,ties.method="min")) # port number - lowest error to highest error
			path <- paste(saveDir, '/port_rank.csv', sep = '')
				write.table(port_rank, path, na = "", col.names = FALSE, row.names = FALSE, append = TRUE, sep = ",")		
				
			m_error_ts <- t(cumul_error/j) # mean error pareto time series
			path <- paste(saveDir, '/m_error_ts.csv', sep = '')
				write.table(m_error_ts, path, na = "", col.names = FALSE, row.names = FALSE, append = TRUE, sep = ",")				
	}
}else {j<-sim}


	
################# OUTPUT TABLE ################# 

#Determine the last simulation 
	if(j != sim){last_sim <- j-1
	}else{last_sim <- sim}
	
#Calculate mean error for each portfolio across all simulations
	mean_error <- cumul_error/last_sim
	
#Link portfolios and mean error
	portfolio_number <- seq(1:nrow(port))
	results <- cbind(portfolio_number,port, mean_error)
	colnames(results) <- c("Portfolio",chem$Parameter,"Mean_Error")

#Pareto table 
	pareto <- as.data.frame(results)
	lastcol <- ncol(pareto) - 1
	pareto$Test_Count <- NA
	pareto$Test_Count <- rowSums(pareto[,2:lastcol])

#Portfolio costs
	costs <- port
	for (n in 1:nrow(chem)){costs[which(costs[,n]==1),n] <- chem$Cost_USD[n]}
	pareto$Cost_USD <- rowSums(costs)
	
#Portfolio BA levels	
	balevel <- port
	balevel[which(balevel == 0)] <- NA	
	for (n in 1:nrow(chem)){balevel[which(balevel[,n]==1),n] <- chem$BA_Level[n]}
	pareto$BA_Level <- apply(format(balevel), 1, paste, collapse=",")
	pareto$BA_Level <- gsub('NA,', '', pareto$BA_Level)
	pareto$BA_Level <- gsub('NA', '', pareto$BA_Level)
	
	X <- which(substr(pareto$BA_Level, nchar(pareto$BA_Level), nchar(pareto$BA_Level))!="" & substr(pareto$BA_Level, nchar(pareto$BA_Level), nchar(pareto$BA_Level))==",")
	pareto$BA_Level[X] <- substr(pareto$BA_Level[X], 1, nchar(pareto$BA_Level[X])-1)
	pareto$BA_Level <- as.character(pareto$BA_Level)
	
#Subset of pareto frontier levels by cost
	pref <- low(Mean_Error) * low(Cost_USD)
	pareto <- psel(pareto, pref, top = nrow(pareto)) 
	names(pareto)[which(colnames(pareto)==".level")] <- "Frontier_Cost"
	
#Ordered pareto frontier
	pareto_o <- pareto[order(pareto$Test_Count,-pareto$Mean_Error),]

#Subset of pareto frontier by # of tests
	grabrow <- aggregate(pareto$Portfolio ~ pareto$Test_Count, data=pareto,length)[,2]
	for (i in 2:length(grabrow)){ grabrow[i] <- grabrow[i] + grabrow[i-1]}
	pareto_o$Frontier_Test <- "NO"
	pareto_o$Frontier_Test[grabrow] <- "YES"	

#Name tests
	pareto_o$Test_Set <- NA
	for (n in 1:nrow(pareto_o)){
		X <- colnames(pareto_o[n,which(pareto_o[n,] == 1)]) 
		pareto_o$Test_Set[n] <- toString(X[which(X %in% param)])
	}

#Add expected value	
	pareto_o$Expected_EcoCF <- NA
	pareto_o$Expected_EcoCF <- expected_score
	
#Change directory path to results folder
	if (!dir.exists(resultsDir)){
		dir.create(resultsDir)
	}

#Write table	
	write.csv(pareto_o, paste(saveDir,'/pareto_o.csv',sep=""),row.names=FALSE)	
	write.csv(pareto_o,paste(resultsDir,'/VoI Portfolios_',last_sim,'-sim','.csv',sep=""),row.names=FALSE)

################# RUNTIME #################
	
	end_time <- Sys.time()	
	end_time - start_time
	
	# close progress bar
		close(pb)

### end ###
	