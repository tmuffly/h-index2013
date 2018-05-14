
a <- dir(pattern = ".rds")
h_index2013 <- matrix(nrow=length(a), ncol=1)
h_index <- matrix(nrow=length(a), ncol=1)

for (i in 1:length(a)){
  df <- readRDS(a[i])
  h_index2013[i] <- max(df$crank2013[which(df$c2013 >= df$crank2013)])
}

for (i in 1:length(a)){
  df <- readRDS(a[i])
  df$crank <- row_number(-df$cites)
  h_index[i] <- max(df$crank[which(df$cites >= df$crank)])
}

b <- as.matrix(a)
faculty <- as.data.frame(cbind(h_index, h_index2013))
faculty <- as.data.frame(cbind(b, faculty))

faculty$b <- sub("13.rds", "", faculty$b, ignore.case =FALSE, fixed=TRUE)

names(faculty) <- c("Dept", "h-index", "h-index2013")
