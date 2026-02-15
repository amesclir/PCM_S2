library(caper)
?pgls
?comparative.data
primate.data<-read.csv("primateEyes.csv",row.names=1,stringsAsFactors=TRUE)
## inspect data
head(primate.data,4)

## read tree from file and inspect
primate.tree<-read.tree("primateEyes.phy")
print(primate.tree,printlen=2)

primate.data<- cbind(row.names(primate.data),primate.data)
colnames(primate.data)[1]<-"Species"

primate.comparative.data <- comparative.data(primate.tree, primate.data, "Species")
print(primate.comparative.data)

primate.pgls.caper <- pgls(log(Orbit_area)~log(Skull_length), primate.comparative.data, lambda = "ML")
summary(primate.pgls.caper)     

primate.pgls.caper2 <- pgls(log(Orbit_area)~log(Skull_length)+Activity_pattern, primate.comparative.data, lambda = "ML")
summary(primate.pgls.caper2)     
