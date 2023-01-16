library(e1071)
library(caTools)
library(class)
library(neuralnet)
data0 = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/balance-scale/balance-scale.data")


idx=sample(1:nrow(data0),0.75*nrow(data0))
train=data0[idx,]
test=data0[-idx,]

head(data0)
model=neuralnet(B ~ X1+ X1.1+X1.2+X1.3 ,data=train,
                hidden = 2)
plot(model)

mypredict=compute(model,test[-1])$net.result
maxidx=function(x){
  return(which(x==max(x)))
}
idx=apply(mypredict,1,maxidx)
unique(data0$B)
prediction=c('B','L','R')[idx]

cm=table(prediction,test$B)
cm
sum(diag(cm))/sum(cm)