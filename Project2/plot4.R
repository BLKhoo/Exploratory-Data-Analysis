

# Read the  R object data
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")


s<-  SCC[grep("coal", SCC$Short.Name, ignore.case = TRUE), ]

BC <- merge(NEI,s ,by ='SCC')

E <- rowsum(BC$Emissions, BC$year)
e <- as.data.frame( as.table(E) )
names(e) <- c("year","x","emissions")
e$x <- NULL  # remove unwanted column

ggplot(e, aes(x=factor(year),y=emissions/1000)) + geom_bar(stat="identity") + xlab("Year") +
  ylab(expression(paste('PM'[2.5],'K tons'))) +
  labs(title=" Coal Related   Emissions in US") + 
  geom_text(aes(label = round(emissions/1000, 0), size = 6, hjust = 0.5, vjust = 2),col="white")



dev.copy(png,file="Plot4.png",height = 480, width = 480)
dev.off()
 