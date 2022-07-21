
#This code is to refine the raw data of the energy management system of
#N78 Building of Griffith University which is called Sir Samuel Griffith Centre (SSGC)

library(xlsx)
library(lubridate)

#Set the project directory 
setwd("C:/Modelling-RES")


RD <- read.xlsx("./Data/RawData/N78-2019.xlsx",sheetIndex=1,as.data.frame = TRUE,header=TRUE)
head(RD)

DFRD<- data.frame(RD[-c(1:2),-2])
head(DFRD)

N78_dat <- data.frame("Date"=as.numeric(DFRD[,1]),"Pv1"=as.numeric(DFRD$Roof.PV1,NA.rm=TRUE)+as.numeric(DFRD$Roof.PV2,NA.rm=TRUE),
                      "PV2"=as.numeric(DFRD$L3.PV1,NA.rm=TRUE)+as.numeric(DFRD$L3.PV2,NA.rm=TRUE)+as.numeric(DFRD$L2.PV1,NA.rm=TRUE)+
                              as.numeric(DFRD$L2.PV2,NA.rm=TRUE)+as.numeric(DFRD$L1.PV1,NA.rm=TRUE)+
                              as.numeric(DFRD$L1.PV2,NA.rm=TRUE),
                      "EL"=as.numeric(DFRD$to.Electrolyzer,NA.rm=TRUE),
                      "HVAC"=as.numeric(DFRD$to.Chiller.for.HVAC.cold.water,NA.rm=TRUE),
                      "Grid Import"=as.numeric(DFRD$Main.Meter.From.Grid,NA.rm=TRUE),
                      "Grid Export"=as.numeric(DFRD$Main.Meter.to.Grid,NA.rm=TRUE),
                      "FCE"=as.numeric(DFRD$Fuel.Cell.1.energy.delivered,NA.rm=TRUE)+as.numeric(DFRD$Fuel.Cell.2.energy.delivered,NA.rm=TRUE),
                      "ToBidiconv"=as.numeric(DFRD$To.BiDir.1,NA.rm=TRUE)+as.numeric(DFRD$To.BiDir.2,NA.rm=TRUE),
                      "FromBidiconv"=as.numeric(DFRD$From.BiDir.1,NA.rm=TRUE)+as.numeric(DFRD$From.BiDir.2,NA.rm=TRUE),
                      "ElHFlow"=as.numeric(DFRD$Electrolyser.production.rate.from.HLI,NA.rm=TRUE),
                      "HFlow1"=as.numeric(DFRD$Bank.1.Gas.Flow.time.series.average,NA.rm=TRUE),
                      "HFlow2"=as.numeric(DFRD$Bank.2.Gas.Flow.time.series.average,NA.rm=TRUE),
                      "HFlow3"=as.numeric(DFRD$Bank.3.Gas.Flow.time.series.average,NA.rm=TRUE),
                      "HP1"=as.numeric(DFRD$Bank.1.Gas.Pressure.time.series.average,NA.rm=TRUE),
                      "HP2"=as.numeric(DFRD$Bank.2.Gas.Pressure.time.series.average,NA.rm=TRUE),
                      "HP3"=as.numeric(DFRD$Bank.3.Gas.Pressure.time.series.average,NA.rm=TRUE))


datefix=format(as.Date(as.numeric(N78_dat$Date), origin = "1899-12-30 00:00"),"%Y-%m-%d %H:%M")
N78_dat$Date <- format(as.POSIXct(datefix, origin="1970-01-01 00:00"),"%Y-%m-%d %H:%M")
head(N78_dat)
tail(N78_dat,10)





