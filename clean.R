
cleanDataframe <- function()
{ 
  dfStates <- read.csv("scprc_est_2017_18_pop_res.csv")
  #dfStates <- read.csv(url("https://www2.census.gov/programs-surveys/popest/datasets/2010-2017/state/asrh/scprc-est2017-18+pop-res.csv"))
  dfStates <- dfStates[-1,]
  nrow(dfStates)
  dfStates <- dfStates[-52,]
  dfStates <- dfStates[,-1:-4]
  nrow(dfStates)
  colnames(dfStates) <- c("stateName","population","popOver18","percentOver18")
  return(dfStates)
}

dfClean <- cleanDataframe()
dfClean
