NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Balti_motor <- NEI[which(NEI$fips =='24510'& NEI$type == 'ON-ROAD'),]
LA_motor <- NEI[which(NEI$fips =='06037'& NEI$type == 'ON-ROAD'),]
compare_motor <- rbind(Balti_motor, LA_motor)
motor_count <- aggregate(Emissions ~ fips + year, compare_motor, sum)

png(file='plot6.png')
p <- ggplot(motor_count,aes(year,Emissions,color = fips))
p <- p + geom_line(lwd = 1) + 
    labs(title = "Emissions from motor vehicle sources in Baltimore City and LA Country") +
    scale_color_discrete(name='City', breaks=c("06037", "24510"),
                         labels=c("Los Angeles", "Baltimore"))      
p
dev.off()
