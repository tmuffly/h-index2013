library(scholar)
library(tidyverse)


get_profile("ASvjn0IAAAAJ&hl")
ap <- get_publications("ASvjn0IAAAAJ&hl", cstart = 0, pagesize = 100, flush = FALSE)

get_profile("mc3dJxsAAAAJ&hl")
arw <- get_publications("mc3dJxsAAAAJ&hl", cstart = 0, pagesize = 100, flush = FALSE)

get_profile("D7uvADUAAAAJ&hl")
ak <- get_publications("D7uvADUAAAAJ&hl", cstart = 0, pagesize = 100, flush = FALSE)

get_profile("tfhM6eQAAAAJ&hl")
ca <- get_publications("tfhM6eQAAAAJ&hl", cstart = 0, pagesize = 100, flush = FALSE)

get_profile("3D2VR5QAAAAJ&hl")
bk <- get_publications("3D2VR5QAAAAJ&hl", cstart = 0, pagesize = 100, flush = FALSE)

get_profile("wv1o_1IAAAAJ&hl")
la <- get_publications("wv1o_1IAAAAJ&hl", cstart = 0, pagesize = 100, flush = FALSE)

get_profile("QD_s8XwAAAAJ&hl")
mp <- get_publications("QD_s8XwAAAAJ&hl", cstart = 0, pagesize = 100, flush = FALSE)

ph <- bind_rows(ak, ap, arw, bk, ca, la, mp)

ph_u <- distinct(ph, cid, .keep_all = TRUE)
ph_u$crank <- row_number(-ph_u$cites)

write.csv(ph_u, file = "public_health_citations.csv")