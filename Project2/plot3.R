

# Read the  R object data
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")


BC <- subset(NEI, fips =="24510") # select only Baltimore City, Maryland records



ggplot(BC, aes(x=factor(year),y=Emissions)) + geom_bar(stat="identity") + xlab("Year") +
  ylab(expression('PM'[2.5])) + facet_grid( . ~ type ) + 
  labs(title="Baltimore City, Maryland Emissions across four sources")

dev.copy(png,file="plot3.png",height = 480, width = 480)
dev.off()