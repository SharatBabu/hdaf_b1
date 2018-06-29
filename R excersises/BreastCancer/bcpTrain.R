#dtrain <- read.xlsx("./Breast_Cancer_Dataset.xlsx", 
#                 sheetIndex = 1, 
#                 startRow=2, 
#                 colIndex = 2)
library(readxl)
data_train <- read_excel("./Breast_Cancer_Dataset.xlsx", sheet = "Train")
data_test <- read_excel("./Breast_Cancer_Dataset.xlsx", sheet = "Test")
bcd<-glm(Classification ~ .,data=data_train,family=binomial)
#cls1<-na.omit(train_data$Classification)
summary(bcd)

x<-predict(bcd,newdata = data_train, type = "response")
y<-predict(bcd,newdata = data_test, type = "response")
y
a<-ifelse(y>0.5,1,0)
a<-round(a)
library(xlsx)
write.xlsx(a, "./bcp.xlsx", sheet="Test")
#require(caret)
#confusionMatrix(p,cls1)
#confusionMatrix(cls1, q)
#table(ActualValue=train_data$Classification,PredictiveValue=p>0.5)
#table(ActualValue=test_data$Classification,PredictiveValue=q>0.5)

#res<-predict(t,test_data,type="response")
#summary(res)

# TO DETERMINE THE THRESHOLD
#library(ROCR)
#ROCRPred = prediction(p,train_data$Classification)
#ROCRPred<- performance(ROCRPred,"tpr","fpr")
#plot(ROCRPred,colorize=TRUE,print.cutoffs.at=seq(0.1,by=0.1))
