#Data.Post.Util.Sum
masterdefault=newprof
masterdefault$PostUtilSum=cut(masterdefault$PostUtilSum,breaks=c(-Inf,0,500,1000,Inf),label=c(0,1,2,3))
masterdefault$PostUtilSum=as.numeric(as.character(masterdefault$PostUtilSum))
spl=sample.split(masterdefault$churners,0.7)
mastertrain=subset(masterdefault,spl==TRUE)
mastertest=subset(masterdefault,spl==FALSE)
boostrose=xgboost(data=as.matrix(mastertrain[,-3]),label=mastertrain[,3],max_depth=100,eta=1,nthread=4,nrounds=10,objective="binary:logistic")
pred=predict(boostrose,as.matrix(mastertest[,-3]))
accuracy.meas(mastertest[,3], pred)
roc.curve(mastertest[,3], pred, plotit = F)
for(i in 1:100){t[i]=mean(as.numeric(100*pred>i)==mastertest[,3])}
which.max(t)
auc=0.687
table(mastertest[,3],pred>0.71)



cut(yes$Post2,breaks=c(-Inf,0,120,300,Inf),label=c(0,1,2,3))