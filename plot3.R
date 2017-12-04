NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Baltimore_city <- NEI[which(NEI$fips =='24510'),]

k <- aggregate(Emissions ~ type + year, Baltimore_city, sum)
png(file='plot3.png')
library(ggplot2)
p <- ggplot(k,aes(year,Emissions, color = type))
p <- p + geom_line(lwd = 1) + labs(title = "4 sources trends in Baltimore City")
p
dev.off()