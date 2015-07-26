 

# Read the  R object data
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")



BC1 <- subset(NEI, fips =="24510" & type =="ON-ROAD") # Select Baltimore City dataset for on road emissions
E1 <- rowsum(BC1$Emissions, BC1$year)

e1 <- as.data.frame( as.table(E1) )
names(e1) <- c("year","x","emissions")
e1$x <- NULL  # remove unwanted column
e1$city <- "Baltimore City"

BC2 <- subset(NEI, fips =="06037" & type =="ON-ROAD") # Select Baltimore City dataset for on road emissions
E2 <- rowsum(BC2$Emissions, BC2$year)


e2 <- as.data.frame( as.table(E2) )
names(e2) <- c("year","x","emissions")
e2$x <- NULL  # remove unwanted column
e2$city <- "Los Angeles County"

e <- rbind(e1,e2)


ggplot(e, aes(x=factor(year),y=emissions)) + geom_bar(stat="identity") + xlab("Year") +
  ylab(expression('PM'[2.5])) + facet_grid( . ~ city) +
  labs(title="Baltimore City vs Los Angeles County motor vehicle  Related Emissions") + 
  geom_text(aes(label=round(emissions,0),size=1,hjust=0.5,vjust=2),col="white")

dev.copy(png,file="plot6.png",height = 480, width = 480)
dev.off()