
#TrainXgBoost#SalarySalbreduced
masterdefault=read.csv("MasterFileSumit.csv")
spl=sample.split(masterdefault$churners,0.7)
mastertrain=subset(masterdefault,spl==TRUE)
mastertest=subset(masterdefault,spl==FALSE)

dtrain=xgb.DMatrix(data=data.matrix(mastertrain[,-1]),label=data.matrix(mastertrain[,1]))
dtest=xgb.DMatrix(data=data.matrix(mastertest[,-1]),label=data.matrix(mastertest[,1]))
 watchlist=list(train=dtrain,test=dtest)
bst=xgb.train(data=dtrain, max_depth=7, eta=0.5, nrounds=7, watchlist=watchlist, objective = "binary:logistic",eval_metric="auc")
 train-auc:0.667662      test-auc:0.686531 
[2]     train-auc:0.749725      test-auc:0.714522 
[3]     train-auc:0.827135      test-auc:0.736878 
[4]     train-auc:0.856903      test-auc:0.723569 
[5]     train-auc:0.867763      test-auc:0.732434 
[6]     train-auc:0.887712      test-auc:0.725923 
pred=predict(bst,dtest)
accuracy.meas(mastertest[,3], pred)
precision: 0.694
recall: 0.224
F: 0.169


roc.curve(mastertest[,3], pred, plotit = T)
0.726
table(mastertest[,1],pred>0.3)
for(i in 1:100){t[i]=mean(as.numeric(100*pred > i) == mastertest[,1])}
t
95%even at 0.3 which is giving me 44/152;94.44% at 0.2 with 50/152
