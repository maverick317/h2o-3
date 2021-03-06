setwd(normalizePath(dirname(R.utils::commandArgs(asValues=TRUE)$"f")))
source("../../../scripts/h2o-r-test-setup.R")



check.deeplearning_multi <- function() {
  Log.info("Test checks if Deep Learning works fine with a multiclass training and test dataset")
  
  prostate <- h2o.uploadFile(locate("smalldata/logreg/prostate.csv"))
  prostate[,5] <- as.factor(prostate[,5])
  hh <- h2o.deeplearning(x=c(2,3,4),y=5,training_frame=prostate,validation_frame=prostate)
  print(hh)

  
}

doTest("Deep Learning MultiClass Test", check.deeplearning_multi)

