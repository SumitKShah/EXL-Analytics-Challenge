#xgBoost
bst=xgboost(data=as.matrix(boosttrain),label=labeltrain,max_depth=100,
eta=1,nthread=4,nrounds=10,objective="binary:logistic")
#prediction
pred=predict(bst,as.matrix(boosttest))
table(labeltest,pred>0.1)

#ROSE
#imbalanced
boostimb=xgboost(data=as.matrix(boosttrain),label=labeltrain,
max_depth=10,eta=1,nthread=2,nrounds=10,objective="binary:logistic")
predimb=predict(boostimb,as.matrix(boosttest))
accuracy.meas(labeltest, predimb)
roc.curve(labeltest, predimb, plotit = F)
#Rose
data.rose = ROSE(churners ~ ., data = mastertrain)$data
data.rose.train=data.rose
data.rose.train$churners=NULL
data.rose.label=data.rose$churners
boostrose=xgboost(data=as.matrix(data.rose.train),label=data.rose.label,
max_depth=100,eta=1,nthread=4,nrounds=10,objective="binary:logistic")
predrose=predict(boostrose,as.matrix(boosttest))
accuracy.meas(labeltest, predrose)
table(labeltest,predrose>0.1)




t