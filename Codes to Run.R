tripdata0421 <- read_excel("202104-divvy-tripdata.xlsx")

colnames(tripdata0421)

clean_names(tripdata0421)

mtrip0421 <- tripdata0421 %>%
  filter(member_casual== "member")

metrip0421 <- mtrip0421 %>% # Calculating trip time
  mutate(m_trip_time= ended_at-started_at) %>%
  arrange(ride_id)

unique(metrip0421)

metrip0421 %>%
  summarise(min_time= min(m_trip_time), max_time= max(m_trip_time), avg_trip_time=mean(m_trip_time), total_time=sum(m_trip_time))

memtrip0421 <- subset(metrip0421, m_trip_time>0)
View(memtrip0421)

write.csv(memtrip0421,"C:\\SPB_Data\\Case Study 01\\Cleaned Data\\Mem_trip042021.csv", row.names = FALSE)


ctrip0421 <- tripdata0421 %>%
  filter(member_casual== "casual")

cetrip0421 <- ctrip0421 %>% # Calculating trip time
  mutate(trip_time= ended_at-started_at)

unique(cetrip0421)

cetrip0421 %>%
  summarise(min_time= min(trip_time), max_time= max(trip_time), avg_trip_time=mean(trip_time), total_time=sum(trip_time))

castrip0421 <- subset(cetrip0421, trip_time>0)
View(castrip0421)

write.csv(castrip0421,"C:\\SPB_Data\\Case Study 01\\Cleaned Data\\Cas_trip042021.csv", row.names = FALSE)


memtrip0421 %>% # Memeber Riders trip data for the month April 2021
  summarise(mem_min_time= min(m_trip_time), mem_max_time= max(m_trip_time), mem_avg_trip_time=mean(m_trip_time), mem_total_time=sum(m_trip_time))

castrip0421 %>% # Casual Riders trip data for the month April 2021
  summarise(cas_min_time= min(trip_time), cas_max_time= max(trip_time), cas_avg_trip_time=mean(trip_time), cas_total_time=sum(trip_time))

# This was repeated for 12 different files for each month
