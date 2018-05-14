# Load the required packages.  Will install the package, 
# if not already installed.
if (!require(scholar))
  install.packages('scholar')
library(scholar)
if (!require(tidyverse))
  install.packages('tidyverse')
library(tidyverse)


rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Public Health
id <- c("mc3dJxsAAAAJ", "ASvjn0IAAAAJ", "tfhM6eQAAAAJ", "D7uvADUAAAAJ", 
        "3D2VR5QAAAAJ", "wv1o_1IAAAAJ", "QD_s8XwAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "ph13.rds")
write.csv(dept_u, "ph13.csv")



rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Medicine
id <- c("YzxxFJwAAAAJ", "pZ28YVgAAAAJ", "bXoIKFwAAAAJ", "fxUToyAAAAAJ", 
        "gDi6RrEAAAAJ", "BYZ-R9AAAAAJ", "QTmUa8EAAAAJ", "jp7ngMMAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "med13.rds")
write.csv(dept_u, "med13.csv")



rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Parasitology
id <- c("ZlKulqYAAAAJ", "Cj7A9ggAAAAJ", "EueDmSEAAAAJ", "azVK2G8AAAAJ",  
        "02I5eYIAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "parasit13.rds")
write.csv(dept_u, "parasit13.csv")



rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Pediatrics
id <- c("4orbdqQAAAAJ", "un4xq58AAAAJ", "gcF5jPkAAAAJ", "7emxkzQAAAAJ",  
        "sf8gwiAAAAAJ", "hxhSO40AAAAJ", "VHyLJ-EAAAAJ" , "xGBws5AAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "paed13.rds")
write.csv(dept_u, "paed13.csv")



rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Psychiatry
id <- c("0aGzb9cAAAAJ", "nJoDmZoAAAAJ", "WWazn68AAAAJ", "LklmV8gAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "psych13.rds")
write.csv(dept_u, "psych13.csv")




rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Bio chemistry
id <- c("QQlNFVYAAAAJ", "UN6viucAAAAJ", "URtikycAAAAJ", "8HUiLFAAAAAJ",  
        "Hk7YoAMAAAAJ", "k_90vhIAAAAJ", "9AUa73wAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "biochem13.rds")
write.csv(dept_u, "biochem13.csv")



rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Anatomy
id <- c("1rcNyeoAAAAJ", "sIINRb0AAAAJ", "2TWDuRkAAAAJ", "dy6qtWEAAAAJ",  
        "ppEZCjsAAAAJ", "ubtT_-UAAAAJ", "kRvVAOUAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "anat13.rds")
write.csv(dept_u, "anat13.csv")



rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - DDS
id <- c("BhoZ3O4AAAAJ", "Csj1xm4AAAAJ", "g2gMVmcAAAAJ", "qTQnhPgAAAAJ",  
        "iCao3oAAAAAJ", "CYr9QrQAAAAJ", "cTLKmDwAAAAJ", "yzNIHBEAAAAJ", 
        "3duAJmAAAAAJ", "g-2p4vwAAAAJ", "lsvp6L4AAAAJ", "mSE1ePwAAAAJ", 
        "vhOVzc8AAAAJ", "UYtloOQAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "dds13.rds")
write.csv(dept_u, "dds13.csv")

rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Family medicine
id <- c("SCnisRAAAAAJ", "za5lcsYAAAAJ", "xRssXEcAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "fm13.rds")
write.csv(dept_u, "fm13csv")




rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Forensic Medicine
id <- c("tKJL2XAAAAAJ", "Cyoc1fkAAAAJ", "IcztXNcAAAAJ", "hd17gsMAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "forensic13.rds")
write.csv(dept_u, "forensic13.csv")




rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Medical education
id <- c("tTIbjRcAAAAJ", "UXpZiVIAAAAJ", "Zaw4oyoAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "mec13.rds")
write.csv(dept_u, "mec13.csv")




rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Medical microbiology
id <- c("rmEPVoEAAAAJ", "IC8m4wQAAAAJ", "eh1uH8sAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "micro13.rds")
write.csv(dept_u, "micro13.csv")




rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Pathalogy
id <- c("BC4tRMUAAAAJ", "0BohUN8AAAAJ", "BjGRn1EAAAAJ", "QPSMiGgAAAAJ",  
        "TNR31KUAAAAJ", "lDBNnCsAAAAJ", "5WCC4tMAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "path13.rds")
write.csv(dept_u, "path13.csv")



rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Pharmacology
id <- c("y7oxRjIAAAAJ", "rbV5ri8AAAAJ", "pQxesckAAAAJ", "_tEWn6oAAAAJ" , "POecS_wAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "pharm13.rds")
write.csv(dept_u, "pharm13.csv")




rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - Dept of Physiology
id <- c("Hr3eUVkAAAAJ", "RV7T7asAAAAJ", "CUcm1gkAAAAJ", "fJQ-0g0AAAAJ",  
        "1zEiaisAAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "phys13.rds")
write.csv(dept_u, "phys13.csv")



rm(list = ls(envir = .GlobalEnv), envir = .GlobalEnv)
# Google scholar author ids - MMU
id <- c("x34TRjYAAAAJ", "AjVlDW0AAAAJ")
source("h2013-generic.R")
saveRDS(dept_u, "mmu13.rds")
write.csv(dept_u, "mmu13.csv")

