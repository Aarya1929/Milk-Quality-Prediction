cp<- read.csv("milknew.csv")

#NA values
str(cp) #no missing values - no need of imputation

cp$Grade=as.factor(cp$Grade)

#class imbalance
dim(cp)
table(cp$Grade)
prop.table(table(cp$Grade)) #no class imbalance

#create training and testing data partitions
library(caret)
set.seed(9999)
train <- createDataPartition(cp[,"Grade"],p=0.70,list=FALSE)
trn <- cp[train,]
tst <- cp[-train,]

#Algorithms applying
ctrl<-trainControl(method = "cv",number = 10)

#Decision Trees
set.seed(9999)
dec1<-train(Grade~.,data = trn,method="rpart",trControl=ctrl,tuneGrid = expand.grid(cp = 0.1))#cp - hyperparameter
pred_1<-predict(dec1,tst)
confusionMatrix(table(tst[,"Grade"],pred_1))

library(rpart)
tree<-rpart(Grade~.,trn)
library(rpart.plot)
prp(tree)

#SVM Radial
set.seed(9999)
svm_r_grid =expand.grid(sigma = c(0.01, 0.015, 0.2),C = c(0.75, 0.9, 1, 1.1, 1.25))
svm_r<-train(Grade~.,data=trn,method="svmRadial",trControl=ctrl,tuneGrid = svm_r_grid)
pred_2<-predict(svm_r,tst)
confusionMatrix(table(tst[,"Grade"],pred_2))

#Neural Network
set.seed(9999)
nn<-train(Grade~.,data=trn,method="nnet",trControl=ctrl)
pred_3<-predict(nn,tst)
confusionMatrix(table(tst[,"Grade"],pred_3))

