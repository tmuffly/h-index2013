# Run this after the departmental_citations_dname_brief

b2$c2013 <- 0
au <- "ASvjn0IAAAAJ"
n <- nrow(b2)
for (i in 1:n) {
assign(paste("b2", i, sep = ""), as_data_frame(get_article_cite_history(au, b2$pubid[i])))
  
b2[i, 9] <-  get(paste("b2", i, sep = "")) %>%
    filter(year > 2012) %>%
    summarize(sum(cites))
rm(list = (paste("b2", i, sep = "")))
}
