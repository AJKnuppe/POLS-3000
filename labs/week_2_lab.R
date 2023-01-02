## POLS 3000
## Weeks 1-2

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ## ##                                              ## ## ##
## ## ##    Part 1: Loading and Examining the Data    ## ## ##

#This is the path on my machine, use your path:
setwd("set the correct path to the downloaded archive")
load("States.RData")


## The command load() is a function
## We will use functions a lot!
## A function takes an input (raw meat), does something to it (grinds it up), 
## and gives an output (ground meat)
## You can often guess what a function does by its name

## R-speak:
## Data set is called a data frame
## Text variables are called character vectors
## Numerical variables are numeric vectors
## Categorical variables are factors and their categories are called levels
## These are all called objects and appear in the Environment tab
## We can use the R function class() to see what we have!
  
class(States)

## Let's look at our data in more depth!
## Let's use the function View()

View(States)

## What are the observational units of the data set?
## What variables look interesting or unusual to you?

print(States)
head(States)
tail(States)

## What is the problem with the print() function?
## What is the difference between head() and tail()?

## ## Examining the Structure of a Data Set

## We can also examine the structure of a data set in a more compact way
## Let's use the function str()

str(States)

## How many observational units are there?
## How many variables are there?
## Which variables are categorical? Numerical?

## ## Exploring the Dimensions of a Data Set

## The dimensions of a data set are the number of rows and number of columns
## R functions: dim(), nrow(), ncol()

dim(States)
nrow(States)
ncol(States)

## What are these different functions doing?

## ## Exploring Names in a Data Set

## Besides the dimensions, it's often helpful to know the names of the observational units and variables
## R functions: rownames() and colnames()

rownames(States)
colnames(States)

## Can you find Ohio in the set of row names?

## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ## 
## ## Challenge #1: Swing States in 2008

## Did Obama or McCain win Ohio in 2008? Who won Utah? Use a command to look at the data file.

## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ##
## ## Check-In #1: Exploring a Data Set. We have: 

## Loaded a data set into R
## Viewed a data set as a spreadsheet
## Explored the types of variables in a data set
## Examined the dimensions of a data set
 
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ## ##                                              ## ## ##
## ## ##        Part 2: Working with Variables        ## ## ##

## Mission #2: The Margin of Victory
## Was 2008 a landslide? How many states did Obama win versus McCain?

## ## Summarizing the Data Set

## Summarizing a data set using summary()

summary(States)

## How many states are in the West?
## What is the average household income across states?
## What is a drawback of using this function on a data set?

## ## Summarizing a Single Variable

## We can grab a variable using the dollar sign ($) notation:
##   General format: Dataset$Variable

States$HouseholdIncome
States$Region

## We can use the summary() function on single variables!
  
summary(States$HouseholdIncome)
summary(States$Region)

## ## Using Functions on Single Variables

## We can use other functions we learned before as well, including class() and str()

class(States$HouseholdIncome)
class(States$Region)

str(States$HouseholdIncome)
str(States$Region)

## Are these variables categorical or numerical?

## ## Copying a Data Set

## We can use the assignment operator (<-) to copy a data set
## General format: NewDataset <- Dataset

StatesCopy <- States
str(StatesCopy)
class(StatesCopy)

## Is StatesCopy the same as States?

## ## Creating a Standalone Variable

## We can also use “<-” to create a standalone variable
## General format: NewVariable <- Dataset$Variable

HouseholdIncome <- States$HouseholdIncome
str(HouseholdIncome)
class(HouseholdIncome)

## Is HouseholdIncome the same as States$HouseholdIncome?

## ## Cleaning Up the Workspace

## Look at the Environment tab to see all the variables and data sets in the R workspace
## We can also show them in the R console: ls()
## How to remove a variable or data set: rm()

ls()
Population <- States$Population
ls()
summary(Population)
rm(Population)
ls()

## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ##
## ## Challenge #2: The Margin of Victory

## Was 2008 a landslide? How many states did Obama win versus McCain? Find the variable that records that and summarize it.

## Create a variable Winner that is a copy of one of the variables in States and records the winner of each state.
## Then delete the variable Winner.


## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ##
## ## Check-In #2: Working with Variables. We have: 

## Summarized a data set
## Copied a data set
## Created standalone variables
## Summarized and deleted standalone variables

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ## ##                                              ## ## ##
## ## ##  Part 3: Summarizing and Visualizing Data    ## ## ##

## ## Mission #3: Beyond Winning and Losing

## An election is more than just winning or losing. Let's look at some other questions:
## Across all states, what is the average percentage who voted for Obama?
## How many states in the West voted for Obama rather than McCain?

## ## Measures of Central Tendency for a Numerical Variable

## Measures of central tendency
## Mean: mean()
## Median (or 50th percentile): median()

mean(States$HouseholdIncome)
median(States$HouseholdIncome)

## Why is the mean different from the median?

## Measures of Spread for a Numerical Variable

## Measures of spread (or variablity)
## Range: range()
## Standard deviation: sd()
## Inter-quartile range: IQR()

min(States$HouseholdIncome)
max(States$HouseholdIncome)
range(States$HouseholdIncome)
sd(States$HouseholdIncome)
IQR(States$HouseholdIncome)

## ## Visualizing a Single Numerical Variable

## We can create a histogram with hist()
## Optional inputs (or arguments) in an R function are separated by commas
## We can control the number of bins with the option breaks

hist(States$HouseholdIncome)
hist(States$HouseholdIncome, breaks = 3)
hist(States$HouseholdIncome, breaks = 15)

## ## Visualizing Two Numerical Variables

## We can create a scatter plot with plot()
## We have two inputs (or arguments), first for the x-variable and second for the y-variable

plot(States$College, States$ObamaVote)

## What is the relationship between percent college graduates and voting for Obama across states?
## What's the problem with this graph?

## ## Visualizing Two Numerical Variables Redux

## If we include the command text() immediately after we use plot() we can add labels to the scatter plot
## The option labels is used to specify the variable with the labels

plot(States$College, States$ObamaVote)
text(States$College, States$ObamaVote, labels = States$State)

## Which states are highly educated and voted for Obama?
## Can you find Utah?

## ## Table of Counts for a Categorical Variable

## In R-speak, categorical variables are called factors and the different categories = levels
## R function for examining levels: levels()
## To create a table of counts: table()
levels(States$Region)
table(States$Region)
## How many states are in the West (W)?

## ## Table of Counts for Two Categorical Variables

## To create a table of counts for two variables we still use table()
## Now we just specify two variables as inputs
table(States$Region,  States$ObamaMcCain)
## How many states are in the West (W) and voted for McCain?

## ## Visualizing a Single Categorical Variable

## We can also create a bar plot of counts with plot()
## The height of the bars equals the number of observational units in each category (or level)
plot(States$ObamaMcCain)

## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ##
## ## Challenge #3: Beyond Winning and Losing
## Across all states, what is the average percentage who voted for Obama?

## How many states in the West voted for Obama rather than McCain?

## Create a histogram of states' gross product per capita (GSP)

## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ##
## ## Check-In #3: Summarizing and Visualizing Data. We have: 

## Summarized a variable based on its central tendency and spread
## Created a histogram and scatter plot for numerical variables
## Generated tables for categorical variables
## Created a bar graph for a categorical variable

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ## ##                                              ## ## ##
## ## ##  Part 4: Finding and Analyzing Subgroups     ## ## ##

## Mission #4: What About the South?

## The U.S. South is a distinctive cultural and economic region:
## What percentage voted for Obama in Alabama compared to California?

## ## Subsetting Data

## The rows and columns are indexed by position and by name
## We can subset the data set using single bracket notation: [ , ]
## General format:
## Subsetting to a row: data[row, ]
## Subsetting to a column: data[ , column]
## Subsetting to a row and a column: data[row, column]

## How many rows and columns are there in States.RData?

## ## Subsetting a Row of a Data Set

## General format for subsetting to a row: data[row, ]
View(States) # look for the 1st row
States[1, ]
States["Alabama", ]

## What percent of people in Alabama voted for McCain?
## What are other social and political characteristics of Alabama?

## ## Subsetting a Column of a Data Set

## General format for subsetting to a row: data[ , column]
View(States) # look for the 2nd column
States[ , 2]
States[ , "HouseholdIncome"]
## Doesn't this look familiar?

## ## Subsetting a Row and a Column a Data Set

## General format for subsetting to a row: data[row, column]
View(States) # look for the 1st row and 2nd column
States[1, 2]
States["Alabama", "HouseholdIncome"]
## What is this result? Why is it a single number? 

## ## Subsetting Multiple Rows and Columns

## Often we want to subset to multiple rows and columns
## To do this, we can use the c() function, which combines (or concatenates) a set of elements
## Again, we can subset using numbers or names
States[c(1, 5), ]
States[c("Alabama", "California"), ]
States[c(1, 5), c(3, 9)]
States[c("Alabama", "California"), c("McCainVote","College")] 
## What percentage voted for McCain in California versus Alabama?

## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ##
## ## Challenge #4: What About the Mountain West? 

## What is the household income in Utah? in Colorado? In Wyoming?

## What percentage voted for Obama in Utah compared to Colorado and Wyoming?

## What percentage voted for Obama and are college-educated in UT compared to CO and WY?


## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ##
## ## Check-In #4: Summarizing and Visualizing Data. We have: 

## Subsetted rows of a data set
## Subsetted columns of a data set
## Subsetted rows and columns of a data set
## Combined elements with the concatenate function

## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##
## ## ##                                                    ## ## ##
## ## ##  Part 5: Importing, Saving, and Exporting Data     ## ## ##

## ## Mission #5: Healthy States, Red States?

## During his presidency, Obama signed the Affordable Care Act (Obamacare), expanding healthcare to more (but not all) citizens
## Did “healthier” states vote for McCain in 2008?

## Loading in New Data

## Our current data set does not have any variables on health
## But we do have StatesHealth.dta
## This is a Stata data file (.dta extension)
## To load this data into R we will need to use the foreign() R package

## The Power of R and R Packages

## Since R is free and open-source, lots of people are writing R packages
## An R package is just a collection of R functions, data, and code in a well-defined format
## R packages can do everything from text mining (tm package) to data visualzation (ggplot2 package) to data wrangling (dplyr package)
## Over 9,000 R packages as of 2017 on CRAN (Comprehensive R Archive Network)

## Browsing R Packages on CRAN

## To see all the R packages in CRAN:
## 1. Go to https://cran.r-project.org/web/packages
## 2. Click on one of these links:
## Table of available packages, sorted by date of publication
## Table of available packages, sorted by name

## Installing Packages in RStudio

## To install R packages in RStudio: GUI versus R Console
## 1. Using the GUI: Go to the Packages tab and click Install
## 2. Using the R Console: Type install.packages("package_name")
## package_name is just the name of the R package in quotes
install.packages("foreign")

## Loading an R Package For Use

## Once you've installed an R package, it's then bundled with R and RStudio
## You now have access to all of the functions, data, code, and other files associated with the installed R package
## However, to access these files you must load your R package
library(foreign)
## You only have to install an R package once, but you must load it every time you start R

## Importing Data into R

## Check your working directory with getwd()
## Set your working directory with setwd()
## Check that the data set is there with dir()
## Read in the Stata data set wtih read.dta()

getwd()
setwd("~/<set your path>.....") 
## Note: "..." should be changed to the location of the Stata data set on your computer
dir()
StatesHealth <- read.dta("StatesHealth.dta")

## Examining the Data Set

## After importing a data set, it's a good idea to check it for possible errors
## Try this R Code:
View(StatesHealth)
head(StatesHealth)
tail(StatesHealth)

## How is this data set different from States.RData?

## Saving the Data Set

## To save the data set as an .RData file, we can use save()
## This will save the data set in the working directory
## We can verify that it's in the directory with dir()

save(StatesHealth, file="StatesHealth.RData")
dir()
## You can also save all data, variables, and other objects in R with save.image()
## Play with this example: 
#save.image("Everything.RData")
#rm(list = ls())
## Then load Everything.RData
#load("Everything.RData") 

## ## Exporting a Data Set

## Saving a data set will give it an .RData extension
## But we can save the States data set as a Stata data set
write.csv(States, file="States.csv")
dir()
## We can now open States.dta with Stata!
  
## ##  More on Importing Data into R

## R can import (and export) many kinds of data:
## Importing Excel Spreadsheets (.xlsx)
## Package: xlsx
## Function: read.xlsx()
## Importing SPSS Files (.sav)
## Package: foreign
## Function: read.spss()
## Importing SAS Files (.xpt)
## Package: foreign
## Function: read.xport()

## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ##
## ## Challenge #5: Healthy States, Red States?

## Did “healthier” states vote for McCain or Obama in 2008? 
## Use plot function like we did with college-educated voters.

## Then create a new .csv file named MiniData that will contain Obese variable

  
## ## ## ## ## ## ## ## ## ## ## ## ## ## 
## ##
## ## Check-In #5: Importing, Saving, and Exporting Data

## Imported a data set into R
## Saved an R data set for later use
## Exported a data set into other formats

## ## Recap 

## Loaded and explored the structure of a data set
## Worked with an R script and installed an R package
## Summarized and visualized numerical and categorical variables
## Found and analyzed subgroups in a data set
## Saved, exported, and imported a data set
