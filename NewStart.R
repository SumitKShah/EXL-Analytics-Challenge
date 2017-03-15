master=read.csv("masternew.csv")
masterfactor=read.csv("masterfactor.csv")
spl=sample.split(masterfactor$churners,0.7)
mastertrain=subset(masterfactor,spl==TRUE)
mastertest=subset(masterfactor,spl==FALSE)
data.rose = ROSE(churners ~ ., data = mastertrain)$data
label.rose=data.rose$churners
data.rose$churners=NULL

boostrose=xgboost(data=as.matrix(data.rose),label=label.rose,
max_depth=100,eta=1,nthread=4,nrounds=10,objective="binary:logistic")