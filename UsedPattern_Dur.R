
#UsedPatternHrs
k[which(k==0)]=median(k)
k[which.max(k)]=median(k)+1.5*IQR(k)
k[which.max(k)]=median(k)+1.5*IQR(k)
d=(k-min(k))/range(k)[2]

#Dur
hist((k-min(k))/range(k)[2])
boxplot is good so no modify
hist(k)
