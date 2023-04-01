library(tidyverse)
library(lubridate)
library(ggplot2)
library(readr)


X202110_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202110-divvy-tripdata.csv")
X202111_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202111-divvy-tripdata.csv")
X202112_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202112-divvy-tripdata.csv")
X202201_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202201-divvy-tripdata.csv")
X202202_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202202-divvy-tripdata.csv")
X202203_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202203-divvy-tripdata.csv")
X202204_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202204-divvy-tripdata.csv")
X202205_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202205-divvy-tripdata.csv")
X202206_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202206-divvy-tripdata.csv")
X202207_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202207-divvy-tripdata.csv")
X202208_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202208-divvy-tripdata.csv")
X202209_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202209-divvy-tripdata.csv")
X202210_divvy_tripdata <- read_csv("~/20221205-capstone_datascience-01/002_data/001_csv/202210-divvy-tripdata.csv")

all_trips <- bind_rows(X202110_divvy_tripdata, X202111_divvy_tripdata, X202112_divvy_tripdata, X202201_divvy_tripdata, X202202_divvy_tripdata, X202203_divvy_tripdata, 
                       X202204_divvy_tripdata, X202205_divvy_tripdata, X202206_divvy_tripdata, X202207_divvy_tripdata, X202208_divvy_tripdata, X202209_divvy_tripdata, 
                       X202210_divvy_tripdata)
str(all_trips)
colnames(all_trips)  #List of column names
nrow(all_trips)  #How many rows are in data frame?
dim(all_trips)  #Dimensions of the data frame?
head(all_trips)  #See the first 6 rows of data frame.  Also tail(all_trips)
str(all_trips)  #See list of columns and data types (numeric, character, etc)
summary(all_trips)  #Statistical summary of data. Mainly for numerics

all_trips$date <- as.Date(all_trips$started_at)
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")
all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at)

all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))

is.factor(all_trips$ride_length)
is.numeric(all_trips$ride_length)

select(all_trips,ride_length)

min(all_trips$ride_length)
max(all_trips$ride_length)

filter(all_trips$start_station_name == "HQ QR")
sum(str_detect(all_trips$start_station_name, 'Kings'))
all_trips %>% select(starts_with("mem"))

NArows <- all_trips[all_trips$start_station_name == "HQ QR",]
NEGridelength <- all_trips[all_trips$ride_length<0,]

temp <- all_trips[all_trips$start_station_name == "HQ QR",]
range(all_trips$start_station_name)

unique(all_trips$rideable_type)
sort(unique(all_trips$start_station_name), decreasing = FALSE)
