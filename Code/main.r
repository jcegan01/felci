# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



# set working directory
wdir <- "C:/Users/xadmin/projects/felci/"
setwd(paste0(wdir,"Code")) 

#load shiny package after install
lapply(c("shiny"), require, character.only = TRUE)

#read in ui and server scripts
source("ui.r")
source("server.r")

#read in page scripts
source("data.r")
source("logic.r")
NUM_PAGES <- 7
source("page1.r")
source("page2.r")
source("page3.r")
source("page4.r")
source("page5.r")
source("page6.r")
source("page7.r")

#New run?
new_input <- winDialog("yesno", "Create input data for a new run?")               

if (new_input == "YES"){shinyApp(ui,server)}

source("voi_run.r")
setwd(paste0(wdir,"Code"))
source("voi_graph.r")


### end ###
winDialog("ok", "Finished")  
### end ###
