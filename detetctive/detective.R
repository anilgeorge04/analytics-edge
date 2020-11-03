# Study Motor Vehicle Theft in Chicago over 12 years

# Read MVT Dataset
mvt = read.csv('mvtWeek1.csv')
# Quick checks
str(mvt)
summary(mvt)
max(mvt$ID)
min(mvt$Beat)

# Study each variable
summary(mvt$Arrest)
# table(mvt$LocationDescription)

mvt$Date[1]
DateConvert = as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M"))
summary(DateConvert)
# Shows that the data is from 1 Jan 2001 to 31 Dec 2012

# Add day and month to mvt
mvt$Month = months(DateConvert)
mvt$Weekday = weekdays(DateConvert)
mvt$Date = DateConvert

# Month with minimum thefts
which.min(table(mvt$Month))
# Weekday with most thefts
which.max(table(mvt$Weekday))
# Month with most arrests
table(mvt$Arrest, mvt$Month)
which.max(tapply(mvt$Arrest, mvt$Month, sum))

# Plots
hist(mvt$Date, breaks=100)
# Crime rate showing a general declining trend from 2002
# Increases from 2008 to 2011 again

table(mvt$Arrest)
boxplot(mvt$Date ~ mvt$Arrest, xlab="Arrest", ylab="Date", main="Arrests over time")
# More crimes for which arrests were made happened between 2003 and 2008

# Proportion of arrests in each year
table(mvt$Arrest, mvt$Year)

# Top 5 Popular locations
sort(table(mvt$LocationDescription), decreasing = TRUE)[1:6]
TopLocations = c("STREET", "PARKING LOT/GARAGE(NON.RESID.)", "ALLEY", "GAS STATION", "DRIVEWAY - RESIDENTIAL")
Top5 = subset(mvt, LocationDescription %in% TopLocations)
str(Top5)
table(Top5$LocationDescription, Top5$Arrest)

table(Top5$LocationDescription, Top5$Weekday)
