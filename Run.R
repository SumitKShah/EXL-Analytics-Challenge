demog=read.csv("Demog_M.csv")

demog$warranty_years=ifelse(demog$Equipment.Warranty=="",0,ifelse(demog$Equipment.Warranty=="Full Year",1,ifelse(demog$Equipment.Warranty=="Full Year Plus 3 Months",1.25,ifelse(demog$Equipment.Warranty=="Three Full Years",3,8))))
