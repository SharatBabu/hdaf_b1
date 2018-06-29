library(readxl)
data_train <- read_excel("./BankLoan.xlsx", sheet = "Train")
data_test <- read_excel("./BankLoan.xlsx", sheet = "Test")
t<-glm(loanStatus ~ .,data=data_train,family=binomial)

#Predicting with regression
p<-predict(t,newdata = data_train, type = "response")
q<-predict(t,newdata = data_test, type = "response")
c<-round(q)

library(xlsx)
write.xlsx(c, "./bla.xlsx", sheet="Test")

