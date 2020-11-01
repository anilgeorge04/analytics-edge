# Combine vectors using Dataframes
Country = c("US", "India", "Brazil", "China")
CovidCases = c(180,120,80,60)
CountryData = data.frame(Country, CovidCases)

# Add new variable to dataframe
CountryData$Population = c(300000, 1000000, 200000, 1200000)

# Add new data
Country = c("Australia", "New Zealand")
CovidCases = c(10, 2)
Population = c(15000000, 5000000)
NewData = data.frame(Country,CovidCases,Population)

# Append or bind to previous dataframe - add new observations
AllCountryData = rbind(CountryData, NewData)
print(AllCountryData)