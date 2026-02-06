# Create Vectors "freq","bloodp","first”, "second”, ”finalDecision”
freq <- c(0.6,0.3,0.4,0.4,0.2,0.6,0.3,0.4,0.9,0.2)
bloodp <- c(103,87,32,42,59,109,78,205,135,176)
first <- c(1,1,1,1,0,0,0,0,NA,1)
second <- c(0,0,1,1,0,0,1,1,1,1)
finalDecision <- c(0,1,0,1,0,1,0,1,1,1)

# Compile into a DF
health <- data.frame(freq,bloodp,first,second,finalDecision)

# Plot "bloodp"
boxplot(health$bloodp,
        main = "Blood Pressure Box Plot",
        ylab = "Blood pressure")
hist(health$bloodp,
     main = "Blood Pressure Histogram",
     xlab = "Blood pressure",
     ylab = "Count")

# Plot "first"
boxplot(health$first,
        main = "Box Plot on 'First' (Discrete Values)")
hist(health$first, 
     main = "Histogram of First Visit Results",
     ylab = "Count", 
     xlab = "Result (0 = Good, 1 = Bad)")
# Making a factor plot 
library(ggplot2)
health$firstfact <- factor(health$first, 
                    levels = c(0,1),
                    labels = c("Good", "Bad"))
ggplot(health, aes(x = firstfact, fill = firstfact)) + 
  geom_bar()+
  labs(
    title = "First Assessment Results",
    y = "Count", 
    x = "Result"
  )+
  scale_fill_manual(
    values = c("Good" = "forestgreen", 
               "Bad" = "red"))+
  theme(legend.position = "none")
  
# Plot "second"
# boxplot(health$second)
hist(health$second)

# Plot "finalDecision"
# boxplot(health$finalDecision)
hist(health$finalDecision)



# Additional Insight - Scatter Plot
health$finalfact <- factor(health$finalDecision, 
                           levels = c(0,1),
                           labels = c("Low", "High"))

ggplot(health, aes(x = bloodp, y = freq, color = finalfact))+
  geom_point(size = 4)+
  scale_color_manual(
    values = c("Low" = "forestgreen", 
               "High" = "red"))+
  labs(
    title = "Impact of Initial Blood Pressure on MD decision",
    x = "Initial Blood Pressure",
    y = "Visit Frequency",
    color = "MD's Final Decision"
  )
