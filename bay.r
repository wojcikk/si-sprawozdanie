library(naivebayes)
library(mlbench)
library(e1071)
library(data.table)
dane = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/balance-scale/balance-scale.data",header = FALSE, stringsAsFactors = T)

View(dane)
xtabs(~V1, data=dane)
idx = sample(2, 178, replace = T, prob=c(0.8,0.2) )

str(dane)
train = dane[idx == 1,]
test = dane[idx ==2,]

model = naive_bayes(V1 ~ .,data=train, usekernel = T)
plot(model)
p = predict(model, test)
cf=table(p, test$V1)
cf
cat("poprawność", sum(diag(cf))/sum(cf)*100, "%")