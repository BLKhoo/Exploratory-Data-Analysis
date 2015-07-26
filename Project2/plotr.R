

# Read the  R object data
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")


s<-  SCC[grep("coal", SCC$Short.Name, ignore.case = TRUE), ]

BC <- merge(NEI,s ,by ='SCC')

E <- rowsum(BC$Emissions, BC$year)
e <- as.data.frame( as.table(E) )
names(e) <- c("year","x","emissions")
e$x <- NULL  # remove unwanted column

png(filename="plot3.png")
ggplot(BC, aes(x=factor(year),y=Emissions)) + geom_bar(stat="identity") + xlab("Year") +
  ylab(expression('PM'[2.5]))  + 
  labs(title="Baltimore City, Maryland Emissions across four sources")

dev.off()
 