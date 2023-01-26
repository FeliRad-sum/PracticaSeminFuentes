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

#Igualar nombres columnas

for (i in 1:length(mortalidad$provincia)){
  mortalidad$provincia[i]<-sub('...','',mortalidad$provincia[i])
}
#Juntar tablas

renta_mortalidad<-merge(mortalidad,renta_filt,
                        by=c("provincia","Periodo"))

#Extraer información

muertes_renta<-subset(renta_mortalidad,Sexo=="Total")
muertes_renta<-subset(muertes_renta,
causa=="001-102  I-XXII.Todas las causas")
muertes_renta_filt<-muertes_renta[,-c(3,4)]
