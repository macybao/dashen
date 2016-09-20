#Getting data off webpages
con = url("http://scholar.google.com/citations?user=HI-I60AAAAJ&hl=en")
htmlCode = readLines(con)
close(con)
htmlCode

install.packages("XML")
library(XML)
url <- "http://scholar.google.com/citations?user=HI-I60AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T)

xpathSApply(html, "//title", xmlValue)

xpathSApply(html, "//td[@id='col-citedby']", xmlValue)

#Get from the httr package
install.packages("httr")
library(httr); html2 = GET(url)
content2 = content(html2, as = "text")
parsedHtml = htmlParse(content2, asText = TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

google = handle("http://google.com")
pg1 = GET(handle=google, path="/")
pg2 = GET(handle=google, path="search")