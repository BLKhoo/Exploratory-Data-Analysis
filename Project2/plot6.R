 

# Read the  R object data
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")



BC <- subset(NEI, fips =="24510" | fips == "06037" ) # Select Baltimore City dataset for on road emissions

E <- rowsum(BC$Emissions, BC$year)
e <- as.data.frame( as.table(E) )
names(e) <- c("year","x","emissions")
e$x <- NULL  # remove unwanted column

ggplot(BC, aes(x=factor(year),y=Emissions)) + geom_bar(stat="identity") + xlab("Year") +
  ylab(expression('PM'[2.5])) + facet_grid( . ~ fips ) +
  labs(title="Baltimore City, Maryland motor vehicle  Related Emissions") + 
  geom_text(aes(label=round(Emissions,0),size=1,hjust=0.5,vjust=2),col="white")

dev.copy(png,file="plot5.png",height = 480, width = 480)
dev.off()