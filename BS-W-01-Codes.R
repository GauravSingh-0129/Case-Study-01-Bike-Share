#=====================
# STEP 1: COLLECT DATA
#=====================

tripdata0420 <- read_excel("202004-divvy-tripdata.xlsx")
tripdata0520 <- read_excel("202005-divvy-tripdata.xlsx")
tripdata0620 <- read_excel("202006-divvy-tripdata.xlsx")
tripdata0720 <- read_excel("202007-divvy-tripdata.xlsx")
tripdata0820 <- read_excel("202008-divvy-tripdata.xlsx")
tripdata0920 <- read_excel("202009-divvy-tripdata.xlsx")
tripdata1020 <- read_excel("202010-divvy-tripdata.xlsx")
tripdata1120 <- read_excel("202011-divvy-tripdata.xlsx")
tripdata1220 <- read_excel("202012-divvy-tripdata.xlsx")
tripdata0121 <- read_excel("202101-divvy-tripdata.xlsx")
tripdata0221 <- read_excel("202102-divvy-tripdata.xlsx")
tripdata0321 <- read_excel("202103-divvy-tripdata.xlsx")
tripdata0421 <- read_excel("202104-divvy-tripdata.xlsx")
q1_2020 <- read_excel("Divvy_Trips_2020_Q1.xlsx")



#====================================================
# STEP 2: WRANGLE DATA AND COMBINE INTO A SINGLE FILE
#====================================================

X2020q1tripdata <-  mutate(X2020q1tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202004tripdata <-  mutate(X202004tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

# This was a part of the Capstone Project that I did earlier
X202005tripdata <-  mutate(X202005tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202006tripdata <-  mutate(X202006tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202007tripdata <-  mutate(X202007tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202008tripdata <-  mutate(X202008tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202009tripdata <-  mutate(X202009tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202010tripdata <-  mutate(X202010tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202011tripdata <-  mutate(X202011tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202012tripdata <-  mutate(X202012tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202101tripdata <-  mutate(X202101tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202102tripdata <-  mutate(X202102tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202103tripdata <-  mutate(X202103tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))

X202104tripdata <-  mutate(X202104tripdata, ride_id = as.character(ride_id)
                           ,rideable_type = as.character(rideable_type)
                           ,start_station_id = as.character(start_station_id)
                           ,end_station_id = as.character(end_station_id))



all_trips <- bind_rows(X202004tripdata, X202005tripdata, X202006tripdata, X202007tripdata, 
                       X202008tripdata, X202009tripdata, X202010tripdata, X202011tripdata, 
                       X202012tripdata, X202101tripdata, X202102tripdata, X202103tripdata, 
                       X202104tripdata)
View(all_trips)



#======================================================
# STEP 3: CLEAN UP AND ADD DATA TO PREPARE FOR ANALYSIS
#======================================================

all_trips <- all_trips %>%  
  select(-c(start_lat, start_lng, end_lat, end_lng))

all_trips$date <- as.Date(all_trips$started_at) #The default format is yyyy-mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at)

is.factor(all_trips$ride_length)
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
is.numeric(all_trips$ride_length)

colnames(all_trips)

all_trips_new <- all_trips[!(all_trips$start_station_name == "HQ QR" | all_trips$ride_length<0),]
write.csv(all_trips_new,"C:\\SPB_Data\\Bike-Share\\XLS Files\\all_trips_new.csv", row.names = FALSE)

View(all_trips_new)

all_trips_new %>%
  summarise(mean_time=mean(ride_length),median_time=median(ride_length),max_time=max(ride_length),min_time=min(ride_length))


#=====================================
# STEP 4: CONDUCT DESCRIPTIVE ANALYSIS
#=====================================

aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)


# See the average ride time by each day for members vs casual users
aggregate(all_trips_new$ride_length ~ all_trips_new$member_casual + all_trips_new$day_of_week, FUN = mean)


# Notice that the days of the week are out of order. Let's fix that.
all_trips_new$day_of_week <- ordered(all_trips_new$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))


# Now, let's run the average ride time by each day for members vs casual users
aggregate(all_trips_new$ride_length ~ all_trips_new$member_casual + all_trips_new$day_of_week, FUN = mean)


# analyze ridership data by type and weekday
all_trips_new %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%  	            #creates weekday field using wday()
  group_by(member_casual, weekday) %>%  			#groups by usertype and weekday
  summarise(number_of_rides = n()				#calculates the number of rides and average duration 
  ,average_duration = mean(ride_length)) %>% 			# calculates the average duration
  arrange(member_casual, weekday)				# sorts


# Let's visualize the number of rides by rider type
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")


# Let's create a visualization for average duration
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")


#=================================================
# STEP 5: EXPORT SUMMARY FILE FOR FURTHER ANALYSIS
#=================================================

# Create a csv file that we will visualize in Excel, Tableau, or my presentation software
counts <- aggregate(all_trips_new$ride_length ~ all_trips_new$member_casual + all_trips_new$day_of_week, FUN = mean)

write.csv(all_trips_new,"C:\\SPB_Data\\Bike-Share\\XLS Files\\all_trips_new.csv", row.names = FALSE)
