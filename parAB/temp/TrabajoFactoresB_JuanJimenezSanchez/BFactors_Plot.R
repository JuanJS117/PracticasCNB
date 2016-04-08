rm(list=ls(all=TRUE))
dir<-"/home/freebit/work/parA_parB/temp/TrabajoFactoresB_JuanJimenezSanchez"
setwd(dir)

ParA.data <- read.table(file = "deltaParA_bfactors.tsv", header = TRUE, sep = "\t")
ParA.data<-ParA.data[18:295,]
ParA.data
ParA.data$atoms<-scale(ParA.data$atoms)
## "scale" function standardizes/normalizes a dataset,
## without having to calculate mean and standard 
## deviation previously

ParB.data <- read.table(file = "omegaParB_bfactors.tsv", header = TRUE, sep = "\t")
ParB.data<-ParB.data[27:68,]
ParB.data
ParB.data$atoms<-scale(ParB.data$atoms)

diff <- ParA.data$atoms - ParB.data$atoms
diff

color1<-rgb(1,0,0,alpha=0.6)
color2<-rgb(0,0,1,alpha=0.6) 


png(filename = "BFactors_bothParProts.png", width=12, height=8, units="in", res=500)
plot(ParA.data$bfactor,ParA.data$atoms, type = "h", col=color1 , lwd=3,xlim = c(0,310), ylim = c(-5,5),xlab = "",ylab="",main="B factor comparison between 1hhp and 3so9")
legend(100,3,c("delta-ParA","omega-ParB"),lty=c(1,1),lwd=c(2.5,2.5),col=c("red","blue"))
par(new=TRUE)
plot(ParB.data$bfactor,ParB.data$atoms, type = "h", col = color2, lwd=3, xlim=c(0,310),ylim=c(-5,5),xlab="Atoms (C alpha)",ylab="B Factors (Standardized)")
dev.off()
