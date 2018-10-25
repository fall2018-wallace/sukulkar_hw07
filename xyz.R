
arrests$stateName <- row.names(arrests)
dfMerged <- merge(dfClean, arrests, By = "stateName")
dfMerged
