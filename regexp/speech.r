library(lubridate)
Sys.setlocale(locale = "C")

raw_data <- readLines("/Users/Jiang/Documents/Develop/GitHub/dashen/regexp/stateoftheunion1790-2012.txt")
raw_data <- paste(raw_data, collapse = "\n")
data <- strsplit(raw_data, "\\n{2}\\*{3}\\n{2}")

macy.extract = function(x) {
    x <- x[-1]
    lapply(x, function(r) {
        d <- strsplit(r, "\\n")
        sapply(d, function(z) {
            print("===")
            name <- z[2]
            date <- z[3]
            print(name)
            date <- parse_date_time(date, "%m%d%Y")
            year <- year(date)
            month <- month(date)
            mday <- mday(date)
            wday <- wday(date)
            print(year)
            print(month)
            print(mday)
            print(wday)
            z <- z[-(1:3)]
            z <- z[which(z!='')]
            line <- length(z)
            print(line)
            speech <- paste(z, collapse = " ")
            sentences <- sapply(gregexpr("\\.\\s", speech), length) + 1
            words <- sapply(gregexpr("\\W+", speech), length) + 1
            print(sentences)
            print(words)
            return(c(name, year, month, mday, wday, line, sentences, words))
        })
    })
}

result <- sapply(data, macy.extract)