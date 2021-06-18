

aggregate(all_trips_new$ride_length ~ all_trips_new$member_casual, FUN = mean)
aggregate(all_trips_new$ride_length ~ all_trips_new$member_casual, FUN = median)
aggregate(all_trips_new$ride_length ~ all_trips_new$member_casual, FUN = max)
aggregate(all_trips_new$ride_length ~ all_trips_new$member_casual, FUN = min)

aggregate(all_trips_new$ride_length ~ all_trips_new$member_casual + 
            all_trips_new$day_of_week, FUN = mean)

all_trips_new$day_of_week <- ordered(all_trips_new$day_of_week, 
                                    levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

all_trips_new %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%
  group_by(member_casual, weekday) %>%
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%
  arrange(member_casual, weekday)

all_trips_new %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n(),average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")

all_trips_new %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")


counts <- aggregate(all_trips_new$ride_length ~ all_trips_new$member_casual + 
                      all_trips_new$day_of_week, FUN = mean)

View(counts)

write.csv(counts,"C:\\SPB_Data\\Bike-Share\\CSV Files\\counts.csv", row.names = FALSE)