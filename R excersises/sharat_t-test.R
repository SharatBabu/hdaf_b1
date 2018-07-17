library(readxl)
s1 <-read_excel("Stock Comparision Infy & TCS_Problem.xlsx", sheet = "Sheet")
ttest<- t.test(s1$INFY,s1$TCS,mu=0,alternative = "two.sided",paired = T,conf.level = 0.95)

ttest
