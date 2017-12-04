NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore_city <- NEI[which(NEI$fips =='24510'),]
kb <- aggregate(Emissions~year, data=Baltimore_city, FUN = sum)
png(file='plot2.png')
plot(kb,type='l',main='Total emissions from PM2.5 in the Baltomore City,Maryland')
dev.off()