# To be run after
# "D:\Dropbox\personal\citation\scholar\department_citations_ph_brief.R"
# "D:\Dropbox\personal\citation\scholar\au2013ak.R"
# "D:\Dropbox\personal\citation\scholar\au2013ap.R"
# "D:\Dropbox\personal\citation\scholar\au2013arw.R"
# "D:\Dropbox\personal\citation\scholar\au2013bk.R"
# "D:\Dropbox\personal\citation\scholar\au2013ca.R"
# "D:\Dropbox\personal\citation\scholar\au2013la.R"
# "D:\Dropbox\personal\citation\scholar\au2013mp.R"

# Make a list of data frames
df_list <- mget(ls(pattern = "b[0-9]"))

# Make a dataframe for the department combining the individual dataframes
dept <- bind_rows(df_list)

# Drop duplicate publications resulting from papers authored by 
# more than one academic from the department
dept_u <- distinct(dept, cid, .keep_all = TRUE)

# Rank the combined list of publications by the number of citations
dept_u$crank <- row_number(-dept_u$c2013)

# Sort the dataframe based on the citations
dept_u <- dept_u[order(-dept_u$c2013),]

# Identify the h-index for the department.

ph_h_index2013 <- max(dept_u$crank[which(dept_u$c2013 >= dept_u$crank)]); ph_h_index2013

write.csv(dept_u, file = "ph_citations2013.csv")
saveRDS(dept_u, file = "ph_citations2.rds")

dir()