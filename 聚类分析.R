install.packages("stats")
library(stats)
data=read.table("clipboard",header=T)
dim(data)
head(data)
names(data)=c("name","score","people","money")
var=data$name
var=as.character(var)
head(data)
for(i in 1:238)row.names(data)[i]=var[i]
head(data)

#EMËã·¨
install.packages("mclust")
library(mclust)
fit_EM=Mclust(data[,-1])
summary(fit_EM)
summary(fit_EM,parameters=TRUE)
plot(fit_EM)
data_BIC=mclustBIC(data[,-1])
data_BICsum=summary(data_BIC,data=data[,-1])
data_BICsum
plot(data_BIC)
data_BIC
plot(data_BIC,G=1:9)
names(data_BICsum)
mclust2Dplot(data[,-1],classification=data_BICsum$classification,parameters=data_BICsum$parameters)
data_dens=densityMclust(data[,-1])
plot(data_dens,data[,-1],col="grey",nlevels=55)
plot(data_dens,type="persp")

#k-¾ùÖµ
fit_km1=kmeans(data[,-1],center=10)
print(fit_km1)
plot(data[,-1],pch=(fit_km1$cluster-1))