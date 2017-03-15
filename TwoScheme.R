#TwoScheme
twoscheme=read.csv("noscheme.csv")
for(i in 1:9963){twoscheme$Scheme1[i]=master$Scheme.ESS[i]+master$Scheme.MXX[i];
twoscheme$Scheme2[i]=master$Scheme.CHC[i]+master$Scheme.CNN[i]+master$Scheme.KLA[i]+master$Scheme.POP[i]+master$Scheme.PPL[i]+master$Scheme.PRM[i]+master$Scheme.PRP[i]+master$Scheme.PRR[i]+master$Scheme.PWM[i]+master$Scheme.PWP[i]+master$Scheme.PWR[i]+master$Scheme.PMM[i];}

spl=sample.split(twoscheme$churners,0.7)
mastertrain=subset(twoscheme,spl==TRUE)
mastertest=subset(twoscheme,spl==FALSE)
boostrose=xgboost(data=as.matrix(mastertrain[,-4]),label=mastertrain[,4],
max_depth=100,eta=1,nthread=4,nrounds=7,objective="binary:logistic")
pred=predict(boostrose,as.matrix(mastertest[,-4]))
accuracy.meas(mastertest[,4], pred)
roc.curve(mastertest[,4], pred, plotit = F)
for(i in 1:100){t[i]=mean(as.numeric(100*pred>i)==mastertest[,4])}
which.max(t)


table(mastertest[,4],pred>0.58)
auc=0.718

                     
                 
                          
n