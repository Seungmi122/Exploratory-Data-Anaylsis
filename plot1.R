NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
kk <- aggregate(Emissions~year, data=NEI, FUN = sum)
png(file='plot1.png')
plot(kk,type='l',main='Total emissions from PM2.5')
dev.off()