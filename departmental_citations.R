# Load the required packages
library(scholar)
library(tidyverse)

# Make a list of Google Scholar ids of the academics in the department
id <- c("mc3dJxsAAAAJ&hl", "ASvjn0IAAAAJ&hl", "tfhM6eQAAAAJ&hl", "D7uvADUAAAAJ&hl", 
        "3D2VR5QAAAAJ&hl", "wv1o_1IAAAAJ&hl", "QD_s8XwAAAAJ&hl")
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
dept_u$cites[which(dept_u$cites == dept_u$crank)]
dept_u$crank[which(dept_u$cites == dept_u$crank)]
