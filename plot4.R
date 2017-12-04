NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
SCC1 <- SCC[,c(1,3)]
merged <- merge(NEI, SCC1)
coal_index <- grep('Coal',merged$Short.Name)
coal_related <- merged[coal_index,]
k <- aggregate(Emissions ~ year, coal_related, sum)
library(ggplot2)
png(file='plot4.png')
p <- ggplot(k,aes(year,Emissions))
p <- p + geom_line(lwd = 1) + labs(title = "Emissions from coal combustion-related sources")
p
dev.off()