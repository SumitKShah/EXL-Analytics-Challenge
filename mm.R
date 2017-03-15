masterdefault=read.csv("MasterFileSumit.csv")
masterdefault$Salary.Slab=as.factor(masterdefault$Salary.Slab)
dmy=dummyVars("~Salary.Slab",data=masterdefault)
add=data.frame(predict(dmy,newdata=masterdefault))
masterdefault=cbind(masterdefault,add)
masterdefault$Salary.Slab=NULL
str(masterdefault)


masterdefault$Age.of.Home=as.factor(masterdefault$Age.of.Home)
dmy=dummyVars("~Age.of.Home",data=masterdefault)
add=data.frame(predict(dmy,newdata=masterdefault))
masterdefault=cbind(masterdefault,add)
masterdefault$Age.of.Home=NULL
str(masterdefault)



for(i in 1:9963){ masterdefault1$Age.of.Home.1[i]= masterdefault1$Age.of.Home.1[i]+ masterdefault1$Age.of.Home.2[i];
 masterdefault1$Age.of.Home.4[i]= masterdefault1$Age.of.Home.4[i]+ masterdefault1$Age.of.Home.7[i];
 masterdefault1$Age.of.Home.12[i]= masterdefault1$Age.of.Home.12[i]+ masterdefault1$Age.of.Home.17[i];
 masterdefault1$Age.of.Home.21[i]= masterdefault1$Age.of.Home.21[i]+ masterdefault1$Age.of.Home.22[i];}
