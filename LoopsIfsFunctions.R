
#

#Loops, Conditional Statements, and Functions

#Grouped expressions in { }

#example - one statement

{3 + 4}

#example

{
  x <- 1
  y <- 2
  z <- x + y
  z
}

# For loop

for(i in 1:10) {
  print(i*i)
}



#While loop
i=1              # you must create the variable before the True/False test.
while(i<=10) {
  print(i*i)
  i=i+1
}


# If Statement

# if (logical expression) {
#   statements
# } else {
#   alternative statements
# }


for(i in 1:10) {
  if(i <= 5){
    print(i*i)
  }else{
    print("counter is greater than 5")
    # cat(i," is greater than 5\n")
  }
}

#####################################################
#
#R Functions
#
#####################################################


# example 1

f1 <- function(x, y) {
  x+y
}

f1( 3, 4)

#####################################################
#Example 2 - only the last line gets returned
#####################################################

f.bad <- function(x, y) {
  2*x + y
  x + 2*y
  2*x + 2*y
  x/y
}

f.bad(1, 2)

#####################################################
#Good example: all fields returned in a col. vector
#####################################################

f.good <- function(x, y) {
  z1 <- 2*x + y
  z2 <- x + 2*y
  z3 <- 2*x + 2*y
  z4 <- x/y
  return(c(z1, z2, z3, z4))
}

f.good(1, 2)
f.good(1,2)$z3

fgood.results <- f.good(1,2)
fgood.results
str(fgood.results)
fgood.results[2]



#####################################################
#Example 3
#Good example: all fields returned in a list
#####################################################

f2 <- function(x, y) {
  z1 <- x + y
  z2 <- x + 2*y
  list(z1, z2) 
}

f2(2, 5)
f2(2,5)[[1]]
f2(2,5)[[1]]
f2(2,5)$z1

#####################################################
#Example 4
#Good example: all fields returned in a list
# ** with named fields ***
#####################################################

f3 <- function(x, y) {
  z1 <- x + y
  z2 <- x + 2*y
  list(result1=z1, result2=z2)
}

f3(2, 5)

f3(2,5)$result1
f3(2,5)$result2

#####################################################
#Example 5
#assign function results to a variable and use named fields
# 
#####################################################


y <- f3(1, 4)
names(y)
y$result2



#####################################################
#Example 6
#R tries to understand the operation based on the object type
# 
#####################################################

#Using vectors 
v1 <- seq(1:5)
v1

v2 <- seq(2, 12, 2)
v2

v3 <- seq(2, 10, 2)
v3

### Error: col. lengths not equal
f3(v1, v2)
### this works!
f3(v1, v3)

#Using matrices
mat1 <- matrix( c(1, 2, 3, 4, 5, 6), ncol=2)
mat1

mat2 <- matrix(c(2, 4, 6, 8, 10, 12), ncol = 2)
mat2

f3(mat1, mat2)


#####################################################
#Example 7
#Default arugments
# 
#####################################################

f4 <- function(x=3, y=2) {
  z1 <- x + y
  z2 <- x + 2*y
  list(result1=z1, result2=z2)
}

#using the defaults values for the x and y arguments
f4()

#using the default value for the y argument
f4(1,  )$result1

f4(x=1)$result1

#using the default value for the x argument
f4(, 1)$result1

f4(y=1)$result1

#switching the order of the arguments
f4(y = 1, x = 2)$result2

#####################################################
#
#  For Loops Revisited
# 
#####################################################

for(i in 2:4) {
  print(i)
}


for(i in c(1, 3, 6, 9)) {
  z <- i + 1
}
z

#using the print statement to see result at each iteration
for(i in 3:5) {
  z <- i + 1
  print(z)
}

#The list does not have to contain numbers
cars <- c("Toyota", "Ford", "Chevy")
for(j in cars) {
  print(j)
}


#####################################################
#
#  Functions AND For Looops
# 
#####################################################


f5 <- function(x) {
  for(i in 1:x) {
    y <- i*2
    print(y)
  }
  return(y*2)
}	

f5(3)

#####################################################
#
#  Functions AND While loops Looops
#  Note that the function returns only the last value
# 
#####################################################


f6 <- function(x) {
  i <- 0 
  while(i < x) {
    i <- i+1
    y <- i*2
    print(y)
  }
  return(y*2)
}	

f6(3)
zz <- f6(3)

##################################################################################
#Passing an unspecified number of parameters to a function
#
#We can pass an unspecified number of parameters to a function by using the ... notation in the argument list. 
#However, the programmer should be careful about the order of the arguments when using the ... notation. 
#Consider the functions f1 and f2 in the following example.
####################################################################################


f1 <- function(x, ...) {
  y <- x+2
  return(y)
  #other commands
}

f2 <- function( ... , x) {
  y <- x+2
  return(y)
  #other commands
}
#In f1 we can pass a value for x either by specifying f1(3) or f1(x=3) and we will get the same results. 
#But in f2 we cannot pass the value for x by specifying f2(3) 
#since f2 will now evaluate 3 as being part of the unspecified parameters. 
#The only way to pass f2 a value for x is by using the notation f2(x=3).

f1(3)


f1(x=3)


f2(3)

f2(x=3)
