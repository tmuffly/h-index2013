# Run this after the departmental_citations_dname_brief

b3$c2013 <- 0
au <- "tfhM6eQAAAAJ"
n <- nrow(b3)
for (i in 1:n) {
assign(paste("b3", i, sep = ""), as_data_frame(get_article_cite_history(au, b3$pubid[i])))
  
b3[i, 9] <-  get(paste("b3", i, sep = "")) %>%
    filter(year > 2012) %>%
    summarize(sum(cites))
rm(list = (paste("b3", i, sep = "")))
}
