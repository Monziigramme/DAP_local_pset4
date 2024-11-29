setwd("C:/Users/momo_/OneDrive/Documents/GitHub/problem-set-4-Monziigramme")
library(arrow)
library(tidyverse)
library(dplyr)
library(ggplot2)
path <- ("C:/Users/momo_/OneDrive - The University of Chicago/Data Programming in R II/pset4")
zipF <- paste0(path, "/nursing-home-inspect-data.zip")
unzip(zipF,exdir=path)

nursing_data <- open_dataset(
  sources = list.files(path, pattern = "\\.csv$", full.names = TRUE),
  col_types = schema(facility_id = string()),
  format = "csv"
)
glimpse(nursing_data)

nursing_parquet <- paste0(path, "/combined_nursing_home_data.parquet")
write_dataset(nursing_data, nursing_parquet, format = "parquet")

nursing_parquet_df <- open_dataset(nursing_parquet)
glimpse(nursing_parquet_df)

nurse_partitioned <- nursing_parquet_df |>
  group_by(state) |>
  collect()

#timing code

timer_function <- function(state_name) {
  start_time_part <- Sys.time()
   
  partition_summary <- nurse_partitioned |>
    filter(state == state_name) |>
    group_by(scope_severity) |>
    summarize(n_deficiences = n())
  
   end_time_part <- Sys.time()
   total_time_part <- end_time_part - start_time_part
   
   
   start_time_nonpart <- Sys.time()
   
   nonpartition_summary <- nursing_parquet_df |>
    filter(state == state_name)|>
     group_by(scope_severity)|>
     summarize(n_deficiencies = n())
   
   end_time_nonpart <- Sys.time()
   total_time_nonpart <- end_time_nonpart - start_time_nonpart
   
   diff_time <- total_time_nonpart - total_time_part
   
   cat("Time with partitioning: ", total_time_part, "seconds\n")
   cat("Time without partitioning: ", total_time_nonpart, "seconds\n")
   cat("Time difference: ", diff_time, "seconds\n")
   
   return(diff_time)
     
} 
#try Alaska in the function
AK <- timer_function("AK")

#part 5 
part_results <- data.frame(state = character(), n_length = numeric(), speed = numeric())

for (s in unique(nurse_partitioned$state)) {
  start_time <- Sys.time()
  
  partition_summary <- nurse_partitioned |>
    filter(state == s) |>
    summarize(n_length = n())
  
  end_time <- Sys.time()
  total_time <- as.numeric(end_time - start_time, units = "secs")
  
  start_time_non <- Sys.time()
  
  nonpartition_summary <- nursing_parquet_df |>
    filter(state == s) |>
    summarize(n_length = n())
  
  end_time_non <- Sys.time()
  total_time_non <- as.numeric(end_time_non - start_time_non, units = "secs")
  
  speed_fast <- total_time_non/total_time
  
  part_results <- rbind(part_results, data.frame(state = s, n_length = partition_summary$n_length, speed = speed_fast))
}
  
p1 <- ggplot(data = part_results, aes(x = n_length, y = speed)) +
    geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Relationship Between Data Size and Partitioning Speed By State",
       x = "Length of data",
       y = "Speed") +
  theme_minimal()
  
  
plot(p1)

ggsave("q1part5.png", plot = p1, width = 6, height = 4, dpi = 300)
