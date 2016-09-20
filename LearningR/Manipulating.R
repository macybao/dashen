#Week3 Lesson1 Subsetting and Sorting
set.seed(13435)
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X
# Subset specific column
X[,1]
X[,"var2"]
# Subset using logical operator
X[(X$var1 <= 3 & X$var3 >11),]
X[(X$var1 <= 3 | X$var3 >15),]
#Subset with the which command to avoid returning NA
X[which(X$var2 > 8),]

#Sort - vector or factor
#order - Dataframe

#Sort
sort(X$var1)
sort(X$var1, decreasing = TRUE)
sort(X$var2, na.last = TRUE)

#Order a dataframe by a variable
X[order(X$var2),]
X[order(X$var1, X$var3),]

#Sort with plyr package
library(plyr)
arrange(X, var2)#similar to order
arrange(X, desc(var1))

#Adding rows and columns
# Method 1
X$var4 <- rnorm(5)
X
# Method 2
Y <- cbind(X,rnorm(5))
Z <- rbind(X,rnorm(4))

#Week 3 Lesson2 Summarizing Data
#Getting data from web
if(!file.exists("/Users/macy/desktop/docs")){dir.create("/Users/macy/desktop/docs")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "/Users/macy/desktop/docs/restaurants.csv", method = "curl")
restData <- read.csv("/Users/macy/desktop/docs/restaurants.csv")

head(restData, n=3)
tail(restData, n=3)
summary(restData)
str(restData)
quantile(restData$councilDistrict, na.rm = TRUE)
#Look at different probabilities
quantile(restData$councilDistrict, probs = c(0.5,0.75, 0.9))
table(restData$zipCode,useNA = "ifany") #userNA: whether to include NA values
#Using table to see the realationship b/w two variables
table(restData$councilDistrict, restData$zipCode)

#Checking for missing values
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

colSums(is.na(restData))
all(colSums(is.na(restData)) == 0)
#Values with specific characteristics
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
#eg. subset restaurants with specific characteristics
restData[restData$zipCode %in% c("21212","21213"), ]

#Cross tabs: identify where the relationship exists in the data set
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)
xt
#larger dataset
warpbreaks$replicate <- rep(1:9, len = 54)
xt2 = xtabs(breaks ~.,data = warpbreaks)
xt2
#With the larger dataset, there were several tables and hard to see-> create flat tables
ftable(xt2)

#See the size of the data
fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")

#Week3 Lesson3 Creating new variables
s1 <- seq(1,10, by=2); s1
s2 <- seq(1,10, length=3); s2
s3 <- c(1,3,8,25,100); seq(along=s3)
#New variable-subsetting variables(#using the dataset extracted from the last lesson)
restData$nearMe <- restData$neighborhood %in% c("Roland Park","Homeland") 
table(restData$nearMe)

#Creating binary variables
restData$zipWrong <- ifelse(restData$zipCode < 0, TRUE, FALSE)
table(restData$zipWrong, restData$zipCode < 0)
#Creating categorical variales
restData$zipGroups <- cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)
##Easier cutting
install.packages("Hmisc")
library(Hmisc)
restData$zipGroups2 <- cut2(restData$zipCode, g=4)
table(restData$zipGroups2)
#Creating factor variables
restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]
class(restData$zcf)
##Levels of factor variables
yesno <- sample(c("yes","no"),size=10,replace = TRUE)
yesnofac <- factor(yesno, levels=c("yes","no"))
relevel(yesnofac, ref="yes")
as.numeric(yesnofac)
#Using mutate function to create a new variable and add to a new dataset simultaneously
library(Hmisc); library(plyr)
restData2 <- mutate(restData, zipGroups=cut2(zipCode, g=4))
table(restData2$zipGroups)

#Common transforms
#abs(x), sqrt(x), ceiling(x), floor(x), round(x, digits=n), signif(x, digits=n)
#cos(x), sin(x), log(x), log2(x), log10(x), exp(x)

#Week3 Lesson4 Reshaping Data
##Goal: tidy data
###Each variable forms a column; each observation forms a row; each table/file stores a data abt
###one kind of observation
library(reshape2)
head(mtcars)
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname","gear","cyl"),measure.vars = c("mpg","hp"))
head(carMelt, n=3)
tail(carMelt, n=3)
#Casting data frames
cylData <- dcast(carMelt, cyl ~ variable)
cylData <- dcast(carMelt, cyl ~ variable, mean)
#Averaging values
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)
#Split values
spIns <- split(InsectSprays$count, InsectSprays$spray)
#apply
sprCount <- lapply(spIns, sum)
#Combine
unlist(sprCount)
sapply(spIns, sum)
#sum witht he plyr package
ddply(InsectSprays,.(spray), summarize, sum=sum(count))

#Week3 Lesson5 Managing data with dplyr
#Week3 Lesson6 Merge Data
#merge(review, solution, by.x="xxx",all=TRUE)
#intersect(names(),names())
#Using join in the plyr package
df1 <- data.frame(id=sample(1:10), x=rnorm(10))
df2 <- data.frame(id=sample(1:10), y=rnorm(10))
arrange(join(df1,df2),id)
#If you have multiple data frames
df1 <- data.frame(id=sample(1:10), x=rnorm(10))
df2 <- data.frame(id=sample(1:10), y=rnorm(10))
df3 <- data.frame(id=sample(1:10), z=rnorm(10))
dfList <- list(df1,df2,df3)
dfList
join_all(dfList)