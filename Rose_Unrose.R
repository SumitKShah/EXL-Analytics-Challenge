#xgboost_with_rose_without_factors


spl=sample.split(masterdefault$churners,0.7)
mastertrain=subset(masterdefault,spl==TRUE)
mastertest=subset(masterdefault,spl==FALSE)
data.rose = ROSE(churners ~ ., data = mastertrain)$data

boostrose=xgboost(data=as.matrix(data.rose),label=label.rose,
max_depth=10,eta=1,nthread=4,nrounds=2,objective="binary:logistic")
test=mastertest
test$churners=NULL
predrose=predict(boostrose,as.matrix(test))
accuracy.meas(mastertest[,2], predrose)
table(predrose)
table(mastertest[,4],predrose>0.1)


#XGboost_without_rose
master=read.csv("masternew.csv")
spl=sample.split(master$churners,0.7)
mastertrain=subset(master,spl==TRUE)
mastertest=subset(master,spl==FALSE)
boosttrain=mastertrain
boosttrain$churners=NULL
boostrose=xgboost(data=as.matrix(boosttrain),label=mastertrain[,4],
max_depth=100,eta=1,nthread=4,nrounds=7,objective="binary:logistic")
test=mastertest
test$churners=NULL
pred=predict(boostrose,as.matrix(test))
accuracy.meas(mastertest[,4], pred)
roc.curve(mastertest[,4], pred, plotit = F)
auc=0.686
table(mastertest[,4],pred>0.1)

str(masterfactor)

#XGBOOST_FACTORS_ROSE
spl=sample.split(masterfactor$churners,0.7)
mastertrain=subset(masterfactor,spl==TRUE)
mastertest=subset(masterfactor,spl==FALSE)
data.rose = ROSE(churners ~ ., data = mastertrain)$data
data.rose[sapply(data.rose,is.factor)]=lapply(data.rose
[sapply(data.rose,is.factor)],as.character)
data.rose[sapply(data.rose,is.character)]=lapply(data.rose
[sapply(data.rose,is.character)],as.numeric)

label.rose=data.rose$churners
data.rose$churners=NULL

boostrose=xgboost(data=as.matrix(data.rose),label=label.rose,
max_depth=10,eta=1,nthread=4,nrounds=2,objective="binary:logistic")
test=mastertest
test$churners=NULL
test[sapply(test,is.factor)]=lapply(test
[sapply(test,is.factor)],as.character)
test[sapply(test,is.character)]=lapply(test
[sapply(test,is.character)],as.numeric)
predrose=predict(boostrose,as.matrix(test))
accuracy.meas(mastertest[,4], predrose)
table(mastertest[,4],predrose>0.1)

#XgBOOST_OVER_Sampling
master=read.csv("masternew.csv")
spl=sample.split(master$churners,0.7)
mastertrain=subset(master,spl==TRUE)
mastertest=subset(master,spl==FALSE)
data_balanced_over=ovun.sample(churners~.,data=mastertrain,method="over",
N=13240)$data
label.over=data_balanced_over$churners
data_balanced_over$churners=NULL
boostover=xgboost(data=as.matrix(data_balanced_over),label=label.over,
max_depth=10,eta=1,nthread=4,nrounds=2,objective="binary:logistic")
test=mastertest
test$churners=NULL
predover=predict(boostover,as.matrix(test))
accuracy.meas(mastertest[,4],predrose)

