# Run this after the departmental_citations_dname_brief

b5$c2013 <- 0
au <- "3D2VR5QAAAAJ"
n <- nrow(b5)
for (i in 1:n) {
assign(paste("b5", i, sep = ""), as_data_frame(get_article_cite_history(au, b5$pubid[i])))
  
b5[i, 9] <-  get(paste("b5", i, sep = "")) %>%
    filter(year > 2012) %>%
    summarize(sum(cites))
rm(list = (paste("b5", i, sep = "")))
}
