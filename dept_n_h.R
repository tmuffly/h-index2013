library(scholar)
library(tidyverse)

id <- c("wv1o_1IAAAAJ&hl", "QD_s8XwAAAAJ&hl")
n    <- length(id)
for (i in 1:n) {
assign(paste("c", i, sep = ""), paste(get_profile(id[i])$name))
assign(paste("d", i, sep = ""), paste(get_profile(id[i])$h_index))
}

n_list <- mget(ls(pattern = "c[0-9]"))
dept_n <- c(n_list)

h_list <- mget(ls(pattern = "d[0-9]"))
dept_h <- c(h_list)

dept_n <- do.call(rbind,lapply(dept_n,data.frame))
dept_h <- do.call(rbind,lapply(dept_h,data.frame))

vlist <- c(dept_n,dept_h)
dept_n_h <- do.call(cbind,lapply(vlist,data.frame))
