##DataSum
k=newprof$DataSum
k[which.max(k)]=median(k)+1.5*IQR(k)
k[which.max(k)]=median(k)+1.5*IQR(k)
k[which.max(k)]=median(k)+1.5*IQR(k)
p=log(1+k)/8
p[which(p==0)]=median(p)-1.5*IQR(p)
hist(p)