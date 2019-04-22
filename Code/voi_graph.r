# Project: FELCI
# Author(s): Dayton, Avi, Jeff 
# Date: 4/24/2018



################# SETUP #################	

#Load Required Packages
	lapply(c("magick"), require, character.only = TRUE)
	
#Start time
	g_start_time <- Sys.time()

#set wd
	if (!exists("resultsDir")){
	 # a <- "2018-05-16 14-51-22"
	 # b <- "2018-05-22 10-09-55"
	 # rundate <- b
	 # resultsDir <- paste0("C:/Users/xadmin/Documents/FELCI/Results/",rundate)
	 # saveDir <- paste0("C:/Users/xadmin/Documents/FELCI/Load_Save/",rundate)
	}
	setwd(resultsDir)

################# GRAPHICS - LOAD #################

#Load files
	port_rank <- read.csv(paste(saveDir, '/port_rank.csv', sep = ''),header = FALSE)
	m_error_ts <- read.csv(paste(saveDir, '/m_error_ts.csv', sep = ''),header = FALSE)
	pareto_o <- read.csv(paste(saveDir, '/pareto_o.csv', sep = ''),header = TRUE)		
	chem <- read.csv(paste(saveDir, '/VoI_Input.csv', sep='')) 
	
#Parameters
	last_sim <- nrow(port_rank)
	port_test_count <- pareto_o$Test_Count[order(pareto_o$Portfolio)]
	#budget <- mean(pareto_o$Cost_USD)
	budget <- chem$Budget_USD[1]
	opt_test_port <- pareto_o$Portfolio[which(pareto_o$Frontier_Test == "YES")]	
	
#Transpose matrices	and determine frontier for mean error tbl
	port_rank_t <- t(port_rank)
	m_error_ts_t <- data.frame(t(m_error_ts))
	m_error_ts_t$Test_Count <- port_test_count
	m_error_ts_to <- m_error_ts_t[order(m_error_ts_t$Test_Count,-m_error_ts_t[,paste0("X",last_sim)]),]
	m_error_ts_to$Frontier_Test <- pareto_o$Frontier_Test

#Finding turning point simulation for frontier
	grabrow <- aggregate(pareto_o$Portfolio ~ pareto_o$Test_Count, data=pareto_o,length)[,2]
	for (i in 2:length(grabrow)){ grabrow[i] <- grabrow[i] + grabrow[i-1]}	
	
	tp <- m_error_ts_t
	for (n in 1:last_sim){
		tp <- tp[order(tp$Test_Count,-tp[,n]),]
		tp[,n] <- "NO"
		tp[grabrow,n] <- "YES"	
	}

	n <- last_sim
	while(identical(tp[,n],tp[,(n-1)]) & n > 1){
		tp_sim <- n
		n <- n-1
	}
	
	rm(tp)

#Max for y-axis	
	ymax <- (max(m_error_ts[nrow(m_error_ts),])+max(m_error_ts))/2
	
#Line weights
	portolio_count <- ncol(port_rank)
		if (portolio_count > 1000) {line_weight <- 1
		}else if (portolio_count < 64) {line_weight <- 1.4
		}else{line_weight <- 1}

#Color spectrum
	port_color <- rainbow(portolio_count)
	rank_color <- rainbow(portolio_count)	
	color_order <- t(port_rank[last_sim,])
	for (z in 1:length(color_order)){rank_color[z] <- port_color[color_order[z]]}
	
################# GRAPHICS - PDF #################
	
### Portfolio Frontier Plot	- Test 
	pdf(paste("Graph",'_Pareto_Test_',last_sim,'-sim','.pdf',sep=""))
	par(mar=c(6,6,5,5))	
	plot(pareto_o$Test_Count,pareto_o$Mean_Error, col=ifelse(pareto_o$Frontier_Test=="YES","red","dark grey"), pch=ifelse(pareto_o$Frontier_Test=="YES",19,1), main="VoI Portfolio Analysis", ylab="USEtox Uncertainty (Mean Error)", xlab="Additional Tests Performed")
	legend("bottomleft", inset = .01, legend=c("Optimal Portfolio", "Sub-optimal Portfolio"),col=c("red", "dark grey"), pch=c(19,1), cex=0.8)
	dev.off()

### Portfolio Frontier Plot	- Cost 
if (is.na(budget)){
	pdf(paste("Graph",'_Pareto_Cost_',last_sim,'-sim','.pdf',sep=""))
	par(mar=c(6,6,5,5))	
	plot(pareto_o$Cost_USD,pareto_o$Mean_Error, col=ifelse(pareto_o$Frontier_Cost==1,"red","dark grey"), pch=ifelse(pareto_o$Frontier_Cost==1,19,1), main="VoI Portfolio Analysis", ylab="USEtox Uncertainty (Mean Error)", xlab="Cost of Additional Testing (USD)")
	legend("bottomleft", inset = .01, legend=c("Optimal Portfolio", "Sub-optimal Portfolio"),col=c("red", "dark grey"), pch=c(19,1),lty=c(0,0),lwd=1.5, cex=0.8)
	dev.off()
}else{
	pdf(paste("Graph",'_Pareto_Cost_',last_sim,'-sim','.pdf',sep=""))
	par(mar=c(6,6,5,5))	
	plot(pareto_o$Cost_USD,pareto_o$Mean_Error, col=ifelse(pareto_o$Frontier_Cost==1 & pareto_o$Cost_USD<=budget,"red","dark grey"), pch=ifelse(pareto_o$Frontier_Cost==1,19,1), main="VoI Portfolio Analysis", ylab="USEtox Uncertainty (Mean Error)", xlab="Cost of Additional Testing (USD)")
	legend("bottomleft", inset = .01, legend=c("Optimal Portfolio", "Sub-optimal Portfolio", "Budget"),col=c("red", "dark grey","dark blue"), pch=c(19,1,NA),lty=c(0,0,2),lwd=1.5, cex=0.8)
	#abline(v = mean(pareto_o$Cost_USD), col="dark blue", lwd=1.5, lty=2)
	abline(v = budget, col="dark blue", lwd=1.5, lty=2)
	dev.off()
}
	
### Ranking Plot- Rainbow
	pdf(paste("Graph",'_Rankings_Rainbow_',last_sim,'-sim','.pdf',sep=""))#, width=16, height=9)	
	par(mar=c(6,6,5,5))
	plot(port_rank_t[1,],type="l", lwd=line_weight, col = "white",ylim=c(0, max(port_rank_t)),main="Ranking (All Portfolios)", ylab="Ranking", xlab="Simulation(s)")
	for (n in 1:nrow(port_rank_t)){lines(port_rank_t[n,], type = "l",  lwd=line_weight, col = rank_color[n])}
	dev.off()	
	
### Ranking Plot- Optimal Portfolios

	pdf(paste("Graph",'_Rankings_Optimal_',last_sim,'-sim','.pdf',sep=""))#, width=16, height=9)
	par(mar=c(6,6,5,5))
	plot(port_rank_t[1,],type="l", lwd=line_weight, col = "white",ylim=c(0, max(port_rank_t)),main="Ranking (Optimal Testing Portfolios)", ylab="Ranking", xlab="Simulation(s)")
	for (n in opt_test_port[2:length(opt_test_port)]){lines(port_rank_t[n,], type = "l",  lwd=line_weight*3/2, col="red")}
	dev.off()	
		
################# GRAPHICS - ANIMATION #################
	
### Animation Plot
	total_frames <- 40 #original: 150
	roundUp <- function(x) 10*ceiling((x)/10)
	frames <- c(1,seq(2,tp_sim,by=ceiling(tp_sim/(total_frames/3))),seq(roundUp(tp_sim),last_sim,by=roundUp((last_sim-roundUp(tp_sim))/(2*total_frames/3))),last_sim)		
	hold_frame <- frames[which.min(abs(frames - tp_sim))+1]

	gc();
	
	img <- image_graph(600, 600, res = 96)	
	for (i in frames){	
		autoviewer_disable();
		
		if (i == hold_frame){
			for (h in 1:25){
				if (h %in% c(6:10,16:20)){
					plot(m_error_ts_to$Test_Count,m_error_ts_to[,tp_sim], col=ifelse(m_error_ts_to$Frontier_Test=="YES",NA,"dark grey"), pch=ifelse(m_error_ts_to$Frontier_Test=="YES",19,1), main="", ylab="USEtox Uncertainty (Mean Error)", xlab="Additional Tests Performed",ylim=c(0, ymax))

					legend("bottomleft", inset = .01, legend=c("Optimal Portfolio", "Sub-optimal Portfolio"),col=c("dark green", "dark grey"), pch=c(19,1), cex=0.8)
				}else{
					plot(m_error_ts_to$Test_Count,m_error_ts_to[,tp_sim], col=ifelse(m_error_ts_to$Frontier_Test=="YES","dark green","dark grey"), pch=ifelse(m_error_ts_to$Frontier_Test=="YES",19,1), main=print(tp_sim), ylab="USEtox Uncertainty (Mean Error)", xlab="Additional Tests Performed",ylim=c(0, ymax))

					legend("bottomleft", inset = .01, legend=c("Optimal Portfolio", "Sub-optimal Portfolio"),col=c("dark green", "dark grey"), pch=c(19,1), cex=0.8)		
				}
			}
		}
			
		plot(m_error_ts_to$Test_Count,m_error_ts_to[,i], col=ifelse(m_error_ts_to$Frontier_Test=="YES","red","dark grey"), pch=ifelse(m_error_ts_to$Frontier_Test=="YES",19,1), main=print(i), ylab="USEtox Uncertainty (Mean Error)", xlab="Additional Tests Performed",ylim=c(0, ymax))

		legend("bottomleft", inset = .01, legend=c("Optimal Portfolio", "Sub-optimal Portfolio"),col=c("red", "dark grey"), pch=c(19,1), cex=0.8)			
	}
	
# Add transition frames
	par(bg = NA, fg = NA)
	for (i in 1:6){
		autoviewer_disable();
		plot(m_error_ts_to$Test_Count,m_error_ts_to[,1],axes=FALSE,xlab="",ylab="")
	}
	dev.off()		
	gc();		
	
# Write gif
	animation <- image_animate(img, fps = 10)
	image_write(animation, paste("VoI_Evolution_",last_sim,'-sim',".gif",sep=""))


################# RUNTIME #################
	
	g_end_time <- Sys.time()	
	g_end_time - g_start_time

### end ###	
