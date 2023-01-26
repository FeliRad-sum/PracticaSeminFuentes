#Carga datos
mortalidad<-read.csv("Input/mortalidad.csv",sep=";")
renta<-read.csv("Input/renta.csv",sep=";")
# Depuración
colnames(renta)[1]<-"provincia"
colnames(renta)[2]<-"indicadores"
renta<-subset(renta,indicadores=="Renta neta media por persona ")
renta_filt<-renta[,-2]
colnames(mortalidad)[1]<-"causa"
mortalidad<-subset(mortalidad,Periodo>2014)
mortalidad<-subset(mortalidad,Periodo<2021)
colnames(mortalidad)[3]<-"provincia"
colnames(mortalidad)[5]<-"num_muertes"
colnames(renta_filt)[3]<-"renta"
