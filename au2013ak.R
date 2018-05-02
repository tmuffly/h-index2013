# Run this after the departmental_citations_dname_brief

b4$c2013 <- 0
au <- "D7uvADUAAAAJ"
n <- nrow(b4)
for (i in 1:n) {
assign(paste("b4", i, sep = ""), as_data_frame(get_article_cite_history(au, b4$pubid[i])))
  
b4[i, 9] <-  get(paste("b4", i, sep = "")) %>%
    filter(year > 2012) %>%
    summarize(sum(cites))
rm(list = (paste("b4", i, sep = "")))
}
