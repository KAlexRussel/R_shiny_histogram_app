library(haven)

data1 <- read_dta("./data/ap1 .dta")

View(data1$a2)
print(max(data1$a2))
