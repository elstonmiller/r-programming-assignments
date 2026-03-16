# Load libraries & data
library(bayesrules)
library(ggplot2)
library(lattice)
library(AER)
library(tidyr)

data("hotel_bookings", package = "bayesrules")
hotel <- hotel_bookings
data("TeachingRatings", package = "AER")
teach <- TeachingRatings
data("CASchools", package = "AER")
school <- CASchools
rm(hotel_bookings,TeachingRatings,CASchools)

# Plotting with base R

hotel$month <- factor(hotel$arrival_date_month,
                      levels = c("January","February","March","April","May","June","July","August","September","October","November","December"))
## Box plot 
plot(hotel$month,hotel$average_daily_rate,
     main = "Average Nightly Hotel Rate by Check-in Month",
     ylab = "Avg. Rate ($)",
     xlab = "",
     las = 2
     )

## Histogram
plot(hotel$month,
     main = "Distribution of Check-in Dates by Month",
     ylab = "Number of Check-ins",
     las = 2
     )

# Plotting with lattice

teach$gender <- gsub("\\bmale", "Male Teachers",teach$gender)
teach$gender <- gsub("\\bfemale", "Female Teachers",teach$gender)

xyplot(eval ~ beauty | gender,
       data = teach,
       type = c("p","g","smooth"),
       scales = "same",
       ylab = "Teaching Evaluation",
       xlab = "Beauty Rating",
       main = "Teaching Evaluation by Students Against Teacher Beauty Rating")

# Plotting with ggplot2

## Format data 
school$income <- school$income * 1000

school_long <- school %>%
  pivot_longer(
    cols = c(math,read),
    names_to = "subject",
    values_to = "score"
  )
school_long$subject <- gsub("math","Math Scores",school_long$subject)
school_long$subject <- gsub("read","Reading Scores",school_long$subject)

## plot 1
ggplot(school, aes(expenditure,math, color = income))+
  geom_point(alpha = 0.6)+
  geom_smooth(
      method = "lm",
      color = "darkgrey",
      se = FALSE
      )+
  labs(
    y = "Average Math Test Score",
    x = "Expenditure per Student ($)",
    title = "Expenditure per Student by Average Test Scores",
    subtitle = "California K-6 & K-8 Schools"
    )+
  scale_color_viridis_c(
    option = "C",
    name = "Avg. Parent\nIncome"
    )+
  theme_bw()

## plot 2
ggplot(school_long, aes(expenditure, score, color = income))+
  geom_point(alpha = 0.6)+
  geom_smooth(
    method = "lm", 
    color = "darkgrey", 
    se = FALSE
    )+
  labs(
    y = "Average Test Scores",
    x = "Expenditure per Student ($)",
    title = "Expenditure per Student by Test Scores",
    subtitle = "California K-6 & K-8 Schools"
    )+
  scale_color_viridis_c(
    option = "C",
    name = "Avg. Parent\nIncome")+
  theme_bw()+
  facet_wrap(
    ~subject,
    scales = "free"
    )
