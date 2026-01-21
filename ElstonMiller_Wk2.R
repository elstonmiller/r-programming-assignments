# Establish "assignment2" vector
assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)

# Run given "myMean" function 
#myMean <- function(assignment2) {
  #return(sum(assignment) / length(someData))
  #}
#myMean(assignment2) #error

# Create new "myMean" function
myMean2 <- function(x) {
  return(sum(x) / length(x))
}

# Test with vector "assignment2"
myMean2(assignment2)
