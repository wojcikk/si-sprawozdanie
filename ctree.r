library(party)
library(partykit)

car = read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/balance-scale/balance-scale.data",header = FALSE, stringsAsFactors = T)

idx=sample(2,150,replace = T, prob=c(0.8,0.2))

train = car[idx == 1,]
test = car[idx ==2,]




train

model = ctree(V1 ~ . , data=car)
plot(model)

p = predict(model, test)
length(p)
length(car$V1)
cf = table (p, test$V1)
cf
sum (diag ( cf )/sum( cf ))
