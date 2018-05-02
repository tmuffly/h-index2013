# Run this after the departmental_citations_dname_brief

b7$c2013 <- 0
au <- "QD_s8XwAAAAJ"
n <- nrow(b7)
for (i in 1:n) {
assign(paste("b7", i, sep = ""), as_data_frame(get_article_cite_history(au, b7$pubid[i])))
  
b7[i, 9] <-  get(paste("b7", i, sep = "")) %>%
    filter(year > 2012) %>%
    summarize(sum(cites))
rm(list = (paste("b7", i, sep = "")))
}
