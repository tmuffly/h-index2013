# Run this after the departmental_citations_dname_brief

b1$c2013 <- 0
au <- "mc3dJxsAAAAJ"
n <- nrow(b1)
for (i in 1:n) {
assign(paste("b1", i, sep = ""), as_data_frame(get_article_cite_history(au, b1$pubid[i])))
  
b1[i, 9] <-  get(paste("b1", i, sep = "")) %>%
    filter(year > 2012) %>%
    summarize(sum(cites))
rm(list = (paste("b1", i, sep = "")))
}
