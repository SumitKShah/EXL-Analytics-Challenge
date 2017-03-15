#NoScheme
noscheme=read.csv("noscheme.csv")
noscheme$Default.Sum=masterdefault$Default.Sum
spl=sample.split(noscheme$churners,0.7)
mastertrain=subset(noscheme,spl==TRUE)
mastertest=subset(noscheme,spl==FALSE)
boostrose=xgboost(data=as.matrix(mastertrain[,-4]),label=mastertrain[,4],
max_depth=100,eta=1,nthread=4,nrounds=7,objective="binary:logistic")
pred=predict(boostrose,as.matrix(mastertest[,-4]))
accuracy.meas(mastertest[,4], pred)
roc.curve(mastertest[,4], pred, plotit = F)
for(i in 1:100){t[i]=mean(as.numeric(100*pred>i)==mastertest[,4])}
which.max(t)

table(mastertest[,4],pred>0.93)
auc=0.687


#previous
precision: 0.569
recall: 0.191
F: 0.143
auc:0.69
#Now
precision: 0.528
recall: 0.184
F: 0.137
auc:0.708

