if (!file.exists("/Users/macy/desktop/test2")){
  dir.create("/Users/macy/desktop/test2")
}

fileUrl <- "https://data.baltimorecity.gov/api/views/aqgr-xx9h/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "/Users/macy/desktop/test2/camera.csv",method = "curl")
list.files("/Users/macy/desktop/test2")

datedownloaded <- date()
datedownloaded

library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData$owner)
jsonData$owner$login

install.packages("data.table")
library(data.table)
DF = data.frame(x=rnorm(9), y=rep(c("a","b","c"),each=3), z=rnorm(9))
DF

DT = data.table(x=rnorm(9), y=rep(c("a","b","c"),each=3), z=rnorm(9))
DT

install.packages("swirl")
packageVersion("swirl")
library(swirl)

install_from_swirl("Getting and Cleaning Data")

mydf <- read.csv(path2csv,stringsAsFactors = FALSE)
dim(mydf)
head(mydf)

library(dplyr)
packageVersion("dplyr")

cran <- tbl_df(mydf)
rm("mydf")

cran

select(cran, ip_id, package, country)

5:20

select(cran, r_arch:country)
select(cran, country:r_arch)
cran

select(cran, -time)

-(5:20)

select(cran, -(X:size))

filter(cran, package == "swirl")
filter(cran, r_version == "3.1.1", country == "US")
?Comparison
filter(cran, r_version <= "3.0.2", country == "IN")
filter(cran, country == "US" | country == "IN")
filter(cran, size > 100500, r_os == "linux-gnu")

!is.na(c(3,5,NA,10))
# Select all rows in cran that r_version is not missing a value
filter(cran, !is.na(r_version))

cran2 <- select(cran, size:ip_id)
arrange(cran2, ip_id)
arrange(cran2, desc(ip_id))
arrange(cran2, package, ip_id)
arrange(cran2, country, desc(r_version), ip_id)

cran3 <- select(cran, ip_id, package, size)
cran3

mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
mutate(cran3, correct_size = size + 1000)

summarize(cran, avg_bytes = mean(size))