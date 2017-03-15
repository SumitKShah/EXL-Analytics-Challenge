use=NULL
use$Account.Number=1:10000
use$Use1[1:10000]=0
use$Use2[1:10000]=0
use$Use3[1:10000]=0
use$Post1[1:10000]=0
use$Post2[1:10000]=0
use$Post3[1:10000]=0
use$Data1[1:10000]=0
use$data2[1:10000]=0
use$Data3[1:10000]=0
use=as.data.frame(use)
jan=read.csv("JanUse.csv")
for(i in 1:10000)
{k=0;l=0;m=0;
for(j in 1:8954){
if(jan$Account.number[j]==i)
{k=k+jan$Used[j];
l=l+jan$Post[j];
m=m+jan$Data[j];
}
}
use$Account.Number[i]=i;
use$Use1[i]=k;
use$Post1[i]=l;
use$Data1[i]=m;
}


feb=read.csv("FebUse.csv")
for(i in 1:10000)
{k=0;l=0;m=0;
for(j in 1:9220){
if(feb$Account.number[j]==i)
{k=k+feb$Used[j];
l=l+feb$Post[j];
m=m+feb$Data[j];
}
}
use$Use2[i]=k;
use$Post2[i]=l;
use$Data2[i]=m;
}

march=read.csv("MarchUse.csv")
for(i in 1:10000)
{
k=0;l=0;m=0;
for(j in 1:9529){if(march$Account.number[j]==i){
k=k+march$Used[j];
l=l+march$Post[j];
m=m+march$Data[j];
}}
use$Used3[i]=k;
use$Post3[i]=l;
use$Data3[i]=m;
}




merged=merge(merged,use,by=Account.Number)
write.csv(merged,"AllPaidDefaultUseData")



















