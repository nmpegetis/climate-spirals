#First, set a working directory
#setwd('~/globalwarming')
library(zoo)

## DATA READING 
#Import the data. Consider first column as row names, also first row as column names. Also, change transform '***' characters to NA and skips 1st line that is the title
crosstable <- read.csv(file='~/Sites/globalwarming/climate-spirals/data/tempAnomaliesMeteo/GLB.Ts.csv', row.names=1, na.strings = c("***", NA), skip=1, header=TRUE)
#Look at the first six rows
head(crosstable)


## DATA MANIPULATION/CLEANSING
#Crop monthly, seasonal and annual means to separate table
ctMonths <- crosstable[,1:12]
ctYear <- crosstable[,13:14]
ctSeasons <- crosstable[,15:18]

#Change titles to numerical (eg. Jan -> 1, Feb ->2, etc)
colnames(ctMonths) <- c(1:12)
colnames(ctYear) <- c(1:2)
colnames(ctSeasons) <- c(1:4)


## DATA TRASFORMATION - preparing data for visualization
#Pivot cross table to list 
monthsLong <- data.frame(rows = rownames(ctMonths), stack(ctMonths))
monthsLong <- monthsLong[order(monthsLong$rows), ]

yearLong <- data.frame(rows = rownames(ctYear), stack(ctYear))
yearLong <- yearLong[order(yearLong$rows), ]

seasonsLong <- data.frame(rows = rownames(ctSeasons), stack(ctSeasons))
seasonsLong <- seasonsLong[order(seasonsLong$rows), ]

#Assuption used: Replace NAs with nearest value
monthsfilled <- na.fill(monthsLong, "extend")
yearfilled <- na.fill(yearLong, "extend")
seasonsfilled <- na.fill(seasonsLong, "extend")

#Swap columns 
monthsfilled <- monthsfilled[,c("rows", "ind", "values")]
yearfilled <- yearfilled[,c("rows", "ind", "values")]
seasonsfilled <- seasonsfilled[,c("rows", "ind", "values")]

#Add title headers to tables
colnames(monthsfilled) <- c("year","month","value")
colnames(yearfilled) <- c("year","type(J-D,D-N)","value")
colnames(seasonsfilled) <- c("year","season(DJF,MAM,JJA,SON)","value")


## EXPORT
# Write CSV in R
write.table(monthsfilled, file = '~/Sites/globalwarming/climate-spirals/data/tempAnomaliesMeteo/monthlyMeanTempMeteo.csv',row.names=FALSE, na="",col.names=TRUE, sep=",",quote=FALSE)
write.table(yearfilled, file = '~/Sites/globalwarming/climate-spirals/data/tempAnomaliesMeteo/annualMeanTempMeteo.csv',row.names=FALSE, na="",col.names=TRUE, sep=",",quote=FALSE)
write.table(seasonsfilled, file = '~/Sites/globalwarming/climate-spirals/data/tempAnomaliesMeteo/seasonalMeanTempMeteo.csv',row.names=FALSE, na="",col.names=TRUE, sep=",",quote=FALSE)
