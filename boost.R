#Default.Sum
masterdefault=master
masterdefault$Default.Sum=cut(masterdefault$Default.Sum,breaks=c(-Inf,0,1000,2000,3000,4000,5000,Inf),label=c(0,1,2,3,4,5,6))
masterdefault$Default.Sum=as.numeric(as.character(masterdefault$Default.Sum))
spl=sample.split(masterdefault$churners,0.7)
mastertrain=subset(masterdefault,spl==TRUE)
mastertest=subset(masterdefault,spl==FALSE)
boostrose=xgboost(data=as.matrix(mastertrain[,-4]),label=mastertrain[,4],
max_depth=100,eta=1,nthread=4,nrounds=7,objective="binary:logistic")
pred=predict(boostrose,as.matrix(mastertest[,-4]))
accuracy.meas(mastertest[,4], pred)
roc.curve(mastertest[,4], pred, plotit = F)
for(i in 1:100){t[i]=mean(as.numeric(100*pred>i)==mastertest[,4])}
which.max(t)
auc=0.721
table(mastertest[,4],pred>0.71)



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

