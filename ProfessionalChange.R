



#ProfessionalInfo
twoscheme$Professional.Info=as.factor(twoscheme$Professional.Info)
dmy=dummyVars("~Professional.Info",data=twoscheme)
add=data.frame(predict(dmy,newdata=twoscheme))

for(i in 1:9963){
add$Professional.Info.5[i]=add$Professional.Info.5[i]+add$Professional.Info.15[i]+add$Professional.Info.6[i]+add$Professional.Info.8[i]+add$Professional.Info.20[i];
add$Professional.Info.12[i]=add$Professional.Info.12[i]+add$Professional.Info.13[i]+add$Professional.Info.14[i]+add$Professional.Info.16[i]+add$Professional.Info.18[i];}





