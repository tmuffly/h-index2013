# Load the required packages.  Will install the package, if not already installed.
if (!require(scholar)) install.packages('scholar')
library(scholar)
if (!require(tidyverse)) install.packages('tidyverse')
library(tidyverse)

# Make a list of Google Scholar ids of the academics in the department
id <- c("mc3dJxsAAAAJ", "ASvjn0IAAAAJ", "tfhM6eQAAAAJ", "D7uvADUAAAAJ", 
        "3D2VR5QAAAAJ", "wv1o_1IAAAAJ", "QD_s8XwAAAAJ")
n    <- length(id)
# Loop through the list of ids & save numbered objects (prefix 'a') 
# containing name & h-index of each academic
# & save numbered dataframes (prefix 'b') 
# containing publication & citation details of each academic

for (i in 1:n) {
  assign(paste("a", i, sep = ""), paste((get_profile(id[i])$name),
                                        ": h-index = ", 
                                        (get_profile(id[i])$h_index)))  
  assign(paste("b", i, sep = ""), 
         as_data_frame(get_publications(id[i]), 
                       cstart = 0, pagesize = 100, flush = FALSE))
}


b1$c2013 <- 0
ARW <- "mc3dJxsAAAAJ"

assign(paste("b1", 1, sep = ""), as_data_frame(get_article_cite_history(ARW, b1$pubid[1])))
  
b1[1, 9] <-  get(paste("b1", 1, sep = "")) %>%
    filter(year > 2012) %>%
    summarize(tcites = sum(cites))
rm(list = (paste("b1", 1, sep = "")))

