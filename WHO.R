# Explore WHO data

# read WHO.csv
WHO = read.csv('WHO.csv')
# check structure
str(WHO)
# SUMMARY stats
summary(WHO)
# Subset Europe
WHO_Europe = subset(WHO, Region == "Europe")
# Write to a CSV
write.csv(WHO_Europe, "WHO_Europe.csv")

# Avg % of population under15 and summary
mean(WHO$Under15)
sd(WHO$Under15)
summary(WHO$Under15)

# Which country has least under15 Population
WHO$Country[which.min(WHO$Under15)]

# GNI vs Fertility Rate
plot(WHO$GNI, WHO$FertilityRate)
Outliers = subset(WHO, GNI > 12000 & FertilityRate > 3)
nrow(Outliers)
Outliers[c("Country","GNI","FertilityRate")]

# Histograms & Boxplots
hist(WHO$CellularSubscribers)
boxplot(WHO$LifeExpectancy ~ WHO$Region, xlab="", ylab="Life Expectancy (in yrs)", main="Life Expectancy by Region")

# Explore data
table(WHO$Region)
# find mean of over60 population by region
tapply(WHO$Over60, WHO$Region, mean)
# Minimum literacy rate in each region, and handle na values
tapply(WHO$LiteracyRate, WHO$Region, min, na.rm=TRUE)
# Avg child mortality rate of countries in each region
tapply(WHO$ChildMortality, WHO$Region, mean)
