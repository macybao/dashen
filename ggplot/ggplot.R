library(ggplot2)
library(magrittr)
library(validate)
library(tidyr)
library(lubridate)
library(scales)
raw_data <- read.csv("/Users/macy/desktop/EDA HW5/hotelData.csv")

# Remove time in date column
clean_data <- raw_data %>% separate(date,into = c("dates","time"),sep = " ")
# How to combine code below with the code above
clean_data <- clean_data[ , !names(clean_data) %in% c('time','area','month')]
print(clean_data)

# Convert all dates to day of the year
clean_data$day <- as.Date(clean_data$dates,format = "%m/%d/%y") %>% yday()
print(clean_data$day)
# Convert all dates to weekdays
clean_data$dates <- as.Date(clean_data$dates,format = "%m/%d/%y") %>% wday(label = T,abbr = F)
print(clean_data$dates)
print(clean_data)


# check for missing values in each column
# Check to simplify the data type validation process for integer and character values
check_that(clean_data,is.na(clean_data),
           typeof(area) == integer,
           typeof(event_min) == integer,
           typeof(max_min) == integer,
           typeof(year) == integer,
           typeof(day) == integer,
           typeof(room) == character,
           typeof(month) == character
) %>% summary()