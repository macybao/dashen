raw_data <- readLines("/Users/Jiang/Documents/Develop/GitHub/dashen/Regular Expression/stateoftheunion1790-2012-test.txt")
#Remove all blank lines
raw_data <- raw_data[which(raw_data!='')]
# Keep the speeches only
m <- which(raw_data=='***')
speech <- raw_data[-(1:m[1])]

# Extract the president's name, year, month, day of month, day of week
# Extract length of the speech(lines), number of sentences and number of words

#Split speeches
speeches <- paste(unlist(speech),collapse = " ")
new_speech <- strsplit(speeches,'[\\*]{3}')
#new_speech <- gsub("[\r\n]","",new_speech)
#str(new_speech)
sapply(new_speech, function(x) lapply(x, function(r) {
    print(r)
}))

