library("readxl")
h1<-read_excel("Housing Data_Problem.xlsx", sheet = "Train2")
str(h1)
summary(h1)
library(caret)
h1$Sno<-NULL

View(h1)

library(caTools)
#'%ni%' <- Negate('%in%')
model1 <- lm( MEDV~.,data=h1)
h2<-read_excel("Housing Data_Problem.xlsx", sheet = "Evaluation2")

MEDV<- predict(model1,h2,type = "response")
h2$MEDV<-NULL
md<-cbind(h2,MEDV)
View(md)
library(xlsx)
write.xlsx(md,file = "hdp.xlsx", sheet = "1", append = TRUE)