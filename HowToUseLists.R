#
# How to use Lists
#

#Create some variables.

ExNums = c(23,52,43)            #example of numbers
ExString = c('pp','qq','rr')    #example of strings
ExBool = c(TRUE,TRUE,FALSE)     #example of booleans

#Create ExList
ExList = list(ExNums,ExString,ExBool)
ExList

str(ExList)

# to get the vector of numbers
ExList[[1]]

# to get the vector of True/false
ExList[[3]]

#Now to get the second element of the numeric vector (ie. the number 52), we add the vector indexing.

ExList[[1]][2]

#NAMES()

#This will name the elements in our list named EXlist.  The Names() function needs a column of text strings. 
names(ExList) = c('ExampleNumbers','ExampleString','ExampleBool')

# Now we can access the elemnts using a $
ExList$ExampleNumbers

# to get the 3rd number in ExmapleNumbers
ExList$ExampleNumbers[3]

str(ExList)

#creating New Lists

newList = list(fred=c(8,7,5), barney =c('xx','yy','zz'))

#get the first element in the list.
newList$fred

# get the 2nd elemetn of the column vector barney
newList$barney[2]
