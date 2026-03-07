# Load packages
library(plyr)

# Load data
Student_assignment_6 <- read.table("Assignment 6 Dataset.txt", header = TRUE, sep = ",")


# Calculate gendered grade avg's and put them back in the table
StudentAverage <- ddply(Student_assignment_6, .(Sex), transform, Grade.Average = mean(Grade))

# Filter to students who's name contains "i"
i_students <- subset(StudentAverage, grepl("i", StudentAverage$Name, ignore.case=T))

# Write dataset into a csv
write.table(i_students,"DataSubset", sep = ",")