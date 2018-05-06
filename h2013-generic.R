
# Steps
# 1 - Make a list of Google scholar ids of the relevant authors and 
#     assign them to id
# 2 - List the name & h-index of each author using get_profile    
# 3 - For each author create a dataframe (named df) of all their articles 
#     in Google scholar using get_publications
# 4 - Keep only the articles with at least one citation
# 5 - Add a column named c2013 (filled with zeros) to the dataframe created 
#     in step 3
# 6 - For each article create a dataframe containining the 
#     number of citations by year using get_article_cite_history, 
#     obtain the sum of citations from 2013 onwards and delete this dataframe 
#     after saving the sum of citations to the relevant row of c2013
# 7 - Assign a unique name to the dataframe created in step 3 (and modified 
#     in steps 4, 5 & 6) and then remove the generic datafrmae named df
# 8 - Repeat steps 3 to 7 for all authors
# 9 - Combine the dataframes of individual authors by using row_bind
# 10 - Remove duplicate articles by using distinct
# 11 - Find the departmental h-index2013 using row_num, max & which



# Make a list of Google Scholar ids of the academics in the department
### Uncomment the next line or use the author-ids file to get list of ids
# id <- c("3D2VR5QAAAAJ", "wv1o_1IAAAAJ")


n    <- length(id)
# Loop through the list of ids & save numbered objects (prefix 'a')
# containing name & h-index of each academic
# & save numbered dataframes (prefix 'b')
# containing publication & citation details of each academic

for (i in 1:n) {
  assign(paste("a", i, sep = ""), paste((get_profile(id[i])$name),
                                        ": h-index = ",
                                        (get_profile(id[i])$h_index)))
  assign("df",
         as_data_frame(
           get_publications(id[i]),
           cstart = 0,
           pagesize = 100,
           flush = FALSE
         ))
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
    assign(paste("df", i, j, sep = ""),
           as_data_frame(get_article_cite_history(au, df$pubid[j])))
    
    df[j, 9] <-  get(paste("df", i, j, sep = "")) %>%
      filter(year > 2012) %>%
      summarize(sum(cites))
    # Citation details of jth paper of ith author has been transfered to the author's dataframe
    # can delete df containing citation details of the jth paper
    rm(list = (paste("df", i, j, sep = "")))
    
    # Show progress (roughly every minute) 
    # in terms of author, paper and current time
    if(j%%15 ==0){print(paste(i, j, Sys.time(), sep = ": "))}
    
    # Take a 4 second break after the loop to avoid getting blocked by Google Scholar
    Sys.sleep(4)
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
dept_u$crank2013 <- row_number(-dept_u$c2013)

# Sort the dataframe based on the citations from 2013
dept_u <- dept_u[order(-dept_u$c2013), ]

# Identify the h-index for the department.

dept_h_index2013 <-
  max(dept_u$crank2013[which(dept_u$c2013 >= dept_u$crank2013)])
print(dept_h_index2013)
