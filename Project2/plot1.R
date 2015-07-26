

# Read the  R object data
NEI <- readRDS("data//summarySCC_PM25.rds")
SCC <- readRDS("data//Source_Classification_Code.rds")

E <- rowsum(NEI$Emissions, NEI$year)
e <- as.data.frame( as.table(E) )
names(e) <- c("year","x","emissions")
e$x <- NULL  # remove unwanted column

barplot(e$emissions/1000, names.arg = e$year, main = expression('Total Emission of PM'[2.5]), 
        xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in K tons')))

dev.copy(png,file="plot1.png",height = 480, width = 480)
dev.off()