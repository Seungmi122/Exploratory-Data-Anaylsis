NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Balti_motor <- NEI[which(NEI$fips =='24510'& NEI$type == 'ON-ROAD'),]
motor_count <- aggregate(Emissions ~ year, Balti_motor, sum)
library(ggplot2)
png(file='plot5.png')
p <- ggplot(motor_count,aes(year,Emissions))
p <- p + geom_line(lwd = 1) + labs(title = "Emissions from motor vehicle sources in Baltimore City")
p
dev.off()

