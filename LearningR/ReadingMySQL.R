install.packages("RMySQL")
library(RMySQL)
ucscDb <- dbConnect(MySQL(),user="genome", 
                    host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;"); dbDisconnect(ucscDb);
result

hg19 <- dbConnect(MySQL(),user="genome", db="hg19",
                    host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
allTables[1:5]
#All the column names
dbListFields(hg19, "affyU133Plus2")
#mysql command: count all the records and return the number
dbGetQuery(hg19, "select count(*) from affyU133Plus2")
affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)
#Select subset of data
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)
afftMisSmall <- fetch(query, n=10); dbClearResult(query)
dim(afftMisSmall)
#Remember to close the connection
dbDisconnect(hg19)