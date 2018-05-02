# Run this after the departmental_citations_dname_brief

b6$c2013 <- 0
au <- "wv1o_1IAAAAJ"
n <- nrow(b6)
for (i in 1:n) {
assign(paste("b6", i, sep = ""), as_data_frame(get_article_cite_history(au, b6$pubid[i])))
  
b6[i, 9] <-  get(paste("b6", i, sep = "")) %>%
    filter(year > 2012) %>%
    summarize(sum(cites))
rm(list = (paste("b6", i, sep = "")))
}
