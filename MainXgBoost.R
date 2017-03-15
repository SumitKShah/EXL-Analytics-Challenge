#TrainXgBoost
masterdefault=read.csv("MasterFileSumit.csv")
spl=sample.split(masterdefault$churners,0.7)
mastertrain=subset(masterdefault,spl==TRUE)
mastertest=subset(masterdefault,spl==FALSE)

dtrain=xgb.DMatrix(data=data.matrix(mastertrain[,-3]),label=data.matrix(mastertrain[,3]))
dtest=xgb.DMatrix(data=data.matrix(mastertest[,-3]),label=data.matrix(mastertest[,3]))
 watchlist=list(train=dtrain,test=dtest)
bst=xgb.train(data=dtrain, max_depth=10, eta=0.5, nrounds=4, watchlist=watchlist, objective = "binary:logistic",eval_metric="auc")
pred=predict(bst,dtest)
accuracy.meas(mastertest[,3], pred)
roc.curve(mastertest[,3], pred, plotit = T)
table(mastertest[,3],pred>0.4)
for(i in 1:100){t[i]=mean(as.numeric(100*pred > i) == mastertest[,3])}
t
t
#Auc:0.733
#Accuracy of 95.38 at 36/152