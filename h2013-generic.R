# Load the required packages.  Will install the package, if not already installed.
if (!require(scholar)) install.packages('scholar')
library(scholar)
if (!require(tidyverse)) install.packages('tidyverse')
library(tidyverse)

# Make a list of Google Scholar ids of the academics in the department
id <- c("3D2VR5QAAAAJ", "wv1o_1IAAAAJ")


n    <- length(id)
# Loop through the list of ids & save numbered objects (prefix 'a') 
# containing name & h-index of each academic
# & save numbered dataframes (prefix 'b') 
# containing publication & citation details of each academic

for (i in 1:n) {
  assign(paste("a", i, sep = ""), paste((get_profile(id[i])$name),
                                        ": h-index = ", 
                                        (get_profile(id[i])$h_index)))  
  assign("df", as_data_frame(get_publications(id[i]), cstart = 0, pagesize = 100, flush = FALSE))
# discard the records with zero citations (citation id is missing - cid = NA)
  df <- filter(df, cid != "NA")
# insert a column (variable) named c2013 to hold the number of citations from 2013 - give an initial value of zero
  df$c2013 <- 0
  au <- id[i]
  m <- nrow(df)
# Show progress in terms of author and current time 
  print(paste(i, Sys.time(), sep = ": "))
# Take a 10 second break after the loop to avoid getting blocked by Google Scholar
    Sys.sleep(10) 
  
  for (j in 1:m) {
# Get total citations from 2013 for the jth paper of ith author    
    assign(paste("df", i, j, sep = ""), as_data_frame(get_article_cite_history(au, df$pubid[j])))
    
    df[j, 9] <-  get(paste("df", i, j, sep = "")) %>%
      filter(year > 2012) %>%
      summarize(sum(cites))
# Citation details of jth paper of ith author has been transfered to the author's dataframe
# can delete df containing citation details of the jth paper   
    rm(list = (paste("df", i, j, sep = "")))
    
# Show progress in terms of author, paper and current time     
    print(paste(i, j, Sys.time(), sep = ": "))
# Take a 5 second break after the loop to avoid getting blocked by Google Scholar
    Sys.sleep(5)
  }
  
assign(paste("b", i, sep = ""), df)
}

rm(df)

# Make a list of data frames
df_list <- mget(ls(pattern = "b[0-9]"))

# Make a dataframe for the department combining the individual dataframes
dept <- bind_rows(df_list)

# Drop duplicate publications resulting from papers authored by 
# more than one academic from the department
dept_u <- distinct(dept, cid, .keep_all = TRUE)

# Rank the combined list of publications by the number of citations from 2013
dept_u$crank <- row_number(-dept_u$c2013)

# Sort the dataframe based on the citations from 2013
dept_u <- dept_u[order(-dept_u$c2013),]

# Identify the h-index for the department.

dept_h_index <- max(dept_u$crank[which(dept_u$c2013 >= dept_u$crank)]); dept_h_index

