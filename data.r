# Project: FELCI
# Author: Jeff Cegan
# Date: 1/10/2018



param <- c(
	"mw",
	"pKaChemClass",	
	"pKa.gain",
	"pKa.loss",
	"Kow",
	"Koc",
	"Kh25c",
	"Pvap25",
	"Sol25",
	"Kdoc",
	"KpSS",
	"KpSd",
	"KpSI",
	"kdegA",
	"kdegW",
	"kdegSd",
	"kdegSI",
	"avlogEC50")

param_info <- c(
	"Molar Mass",
	NA,
	"pKa base reaction",
	"pKa acid reaction",
	"Partitioning coefficient between n-octanol and water",
	"Partitioning coefficient between organic carbon and water",
	"Henrys law constant (@25 C)",
	"Vapor Pressure (@25C)",
	"Solubility (@25C)",
	"Partitioning coefficient between dissolved organic carbon and water",
	"Partitioning coefficient between suspended solids and water",
	"Partitioning coefficient between sediment particles and water",
	"Partitioning coefficient between soil particles and water",
	"Rate constant degradation in air",
	"Rate constant degradation in water",
	"Rate constant degradation in sediment",
	"Rate constant degradation in soil",
	"Average of the log-values of the species-specific ecotoxicity data"
)	
	
param_units <- c(
	"g / mol",
	"unitless",	
	"unitless",
	"unitless",
	"L / L",
	"L / kg",
	"Pa * m^3 / mol",
	"Pa",
	"mg / L",
	"L / kg",
	"L / kg",
	"L / kg",
	"L / kg",
	"1 / sec",
	"1 / sec",
	"1 / sec",
	"1 / sec",
	"log(mg / L)")

param_cost_reference <- c(
	"Assumptions: (1) excluding subscription costs; (2) a conservative estimate of 1 hr to look-up values at a bachelor's level (~$80/hr) probably going to need more than 1 hour to check against literature and other items.",
	NA,
	"Derived from DESHE Budget Activity Level 2 and ERDC cost estimates. Parameter can be derived from the following providers using the testing paradigm derived from OECD 122: ARL, ARDEC, ECBC, ERDC. Cost is from Stevens May 31, 2018",
	"Derived from DESHE Budget Activity Level 2 and ERDC cost estimates. Parameter can be derived from the following providers using the testing paradigm derived from OECD 122: ARL, ARDEC, ECBC, ERDC. Cost is from Stevens May 31, 2018",
	"Derived from DESHE Budget Activity Level 2 and ERDC cost estimates. Parameter can be derived from the following provider using the testing paradigm derived from ASTM 1147: Avomeen Analytical Services. Cost is mean from Moores May 31, 2018",
	"Calculated value and lookup in EPI Suites. Assumptions: (1) excluding subscription costs; (2) a conservative estimate of 1 hr to look-up values at a bachelor's level (~$80/hr) probably going to need more than 1 hour to check against literature and other items.", 
	"Parameter is derived using a default calculation. Cost is from Moores May 31, 2018.", 
	"Actual experimental method determination. Cost range is from 10,000 to 15, 000 depending on complexity. Cost is median value from Moores May 31, 2018.",
	"Acutal experimental method determination. Cost for low complexiity is 2500 from Moores May 31, 2018. Cost for high complexity is 5000 from Stevens May 31, 2018. Time for both is 7 days",
	"Parameter is derived using a default calculation.",
	"Derived from USEtox2.02. Partition coefficient is found in IAEA (2009). Handbook of paramater values for the prediction of radionuclide transfer in terrestrial and freshwater environments (Table 53, please choose field data origin with the exception of Ag(I) for which the ads data origin is preferable). In case IAEA (2009) does not report partitioning coefficients, please refer to the average partitioning coeffcients reported by US EPA (2005). Partition coefficients for metals in surface water, soil, and waste. by Jerry D. Allicon and Terry L. Allison. EPA/600/R-05/074 (Table 5). Actual experimental determination. Cost is from Stevens May 31, 2018",
	"Derived from USEtox2.02. Partition coefficients found in US EPA (2005). Partition coefficients for metals in surface water, soil, and waste. by Jerry D. Allicon and Terry L. Allison. EPA/600/R-05/074 (Table 4). Actual experimental determination. Cost is from Stevens May 31, 2018",
	"Derived from USEtox2.02. Partition coefficient is found in IAEA (2009). Handbook of paramater values for the prediction of radionuclide transfer in terrestrial and freshwater environments (Table 14, prefer all soils soil group. In case IAEA (2009) does not report partitioning coefficients, please refer to the average partitioning coeffcients reported by US EPA (2005). Partition coefficients for metals in surface water, soil, and waste. by Jerry D. Allicon and Terry L. Allison. EPA/600/R-05/074 (Table 3). Actual experimental determination. Cost is from Stevens May 31, 2018",
	"Actual experimental method determination. Cost is  from Moores May 31, 2018",
	"Actual experimental method determination. Cost is  from Moores May 31, 2018",
	"Actual experimental method determination. Cost is  from Stevens May 31, 2018",
	"Actual experimental method determination. Cost is  from Stevens May 31, 2018",
	"ERDC-EL cost from Gust data")

param_costs <- c(
	640,
	NA,
	5500,
	5500,
	2500,
	640,
	1500,
	12500,
	2500,
	0,
	15000,
	15000,
	15000,
	10000,
	15000,
	25000,
	25000,
	1500)
	
param_time_hrs <- c(
	8,
	NA,
	112,
	112,
	56,
	8,
	56,
	112,
	56,
	1,
	112,
	112,
	112,
	280,
	448,
	560,
	560,
	NA)
	
param_ba_level <- c(
	1,
	NA,
	2,
	2,
	2,
	2,
	2,
	2,
	2,
	1,
	3,
	3,
	3,
	3,
	3,
	4,
	4,
	NA)

distro_list <- c("Lognormal", "Normal", "Uniform", "Triangular")

ph_list <- c("Acid","Neutral","Base","Amphoter")

vtext <- c(":")

ctext <- c(" - (USD):")

dtext <- c(" - Distribution Type:")

distro <- read.csv("Input_distributions.csv")
