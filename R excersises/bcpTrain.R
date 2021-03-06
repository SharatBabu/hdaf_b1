#dtrain <- read.xlsx("./Breast_Cancer_Dataset.xlsx", 
#                 sheetIndex = 1, 
#                 startRow=2, 
#                 colIndex = 2)
library(readxl)
train_data <- read_excel("./Breast_Cancer_Dataset.xlsx", sheet = "Train")
test_data <- read_excel("./Breast_Cancer_Dataset.xlsx", sheet = "Test")
t<-glm(Classification ~. -Insulin -Adiponectin,data=train_data,family=binomial)
#cls1<-na.omit(train_data$Classification)
summary(t)

p<-predict(t,newdata = train_data, type = "response")
q<-predict(t,newdata = test_data, type = "response")
q
require(caret)
#confusionMatrix(p,cls1)
#confusionMatrix(cls1, q)
table(ActualValue=train_data$Classification,PredictiveValue=p>0.5)
table(ActualValue=test_data$Classification,PredictiveValue=q>0.5)

res<-predict(t,test_data,type="response")
summary(res)

# TO DETERMINE THE THRESHOLD
library(ROCR)
ROCRPred = prediction(p,train_data$Classification)
ROCRPred<- performance(ROCRPred,"tpr","fpr")
plot(ROCRPred,colorize=TRUE,print.cutoffs.at=seq(0.1,by=0.1))
