# Load the required packages.  Will install the package, 
# if not already installed.
if (!require(scholar))
  install.packages('scholar')
library(scholar)
if (!require(tidyverse))
  install.packages('tidyverse')
library(tidyverse)


rm(list = ls())
# Author ids of BK & LA to see whether h2013-generic.R is working ok
id <- c("3D2VR5QAAAAJ", "wv1o_1IAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "test13.rds")
write.csv(dept_u, "test123.csv")





rm(list = ls())
# Google scholar author ids - Dept of Public Health
id <- c("mc3dJxsAAAAJ", "ASvjn0IAAAAJ", "tfhM6eQAAAAJ", "D7uvADUAAAAJ", 
        "3D2VR5QAAAAJ", "wv1o_1IAAAAJ", "QD_s8XwAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "ph13.rds")
write.csv(dept_u, "ph13.csv")



rm(list = ls())
# Google scholar author ids - Dept of Medicine
id <- c("YzxxFJwAAAAJ", "pZ28YVgAAAAJ", "bXoIKFwAAAAJ", "fxUToyAAAAAJ", 
        "gDi6RrEAAAAJ", "BYZ-R9AAAAAJ", "QTmUa8EAAAAJ", "jp7ngMMAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "med13.rds")
write.csv(dept_u, "med13.csv")


