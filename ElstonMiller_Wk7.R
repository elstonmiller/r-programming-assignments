# S3 Creation 
## Luke Skywalker
Luke = list(name="Luke Skywalker",
            height=178,
            weight=78)
class(Luke) = "Person"
attributes(Luke)
Luke

## Country (a more efficient way to create S3)
Panama = structure(list(
  name="Panama",
  capital="Panama City",
  Language="Spanish",
  Population=4314767),
  class = "Country")
attributes(Panama)
Panama

# S4 Creation 
## Han Solo 
setClass("Character",
         representation(
           name="character",
           movie="character",
           age="numeric"
         ))
Han <- new("Character", 
    name = "Han Solo", 
    movie = "Star Wars",
    age = 32)

## Country S4 example
## Creating a different class than "Country" because country already exists and is S3
setClass("PlacesToVisit", 
         slots = list(
           CountryName="character", 
           Capital="character",
           Language="character",
           Population="numeric"))
Tuvalu <- new("PlacesToVisit",
              CountryName="Tuvalu",
              Capital="Funafuti",
              Population=11792,
              Language=c("Tuvaluan","English"))

# Checking class system (Question 1)
# isS4()
isS4(Han)
isS4(Luke)

#str()
str(Han)
str(Luke)

# class()
class(Luke)
class(Han)

# mode()
mode(Han)
mode(Luke)

# names()
names(Luke)
names(Han)

# Checking Type (Question 2)
vec <- c(1:5)
class(vec)
strn <- c("Hello World", "Hello R")
class(strn)
truee <- TRUE
class(truee)
lst <- list(1,2,"Hello")
class(lst)
class(Han) #S4
class(Luke) #S3

