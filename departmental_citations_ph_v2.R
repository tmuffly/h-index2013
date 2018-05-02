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

# Make a list of data frames
df_list <- mget(ls(pattern = "b[0-9]"))

# Make a dataframe for the department combining the individual dataframes
dept <- bind_rows(df_list)

# Drop duplicate publications resulting from papers authored by 
# more than one academic from the department
dept_u <- distinct(dept, cid, .keep_all = TRUE)

# Rank the combined list of publications by the number of citations
dept_u$crank <- row_number(-dept_u$cites)

# Sort the dataframe based on the citations
dept_u <- dept_u[order(-dept_u$cites),]

# Identify the h-index for the department.

ph_h_index <- max(dept_u$crank[which(dept_u$cites >= dept_u$crank)]); ph_h_index

write.csv(dept_u, file = "ph_citations.csv")
saveRDS(dept_u, file = "ph_citations.rds")

dir()
