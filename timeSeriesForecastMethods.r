install.packages("forecasts")
library(forecast)
#Package has sample data
install.packages("fma")
library(fma)

# Using the beer data set
head(beer)
plot(beer)
str(beer)
summary(beer)
autoplot(beer)

###############################################################
#Forecast for 5 periods using Average Method
meanf(beer,5)

###############################################################
# Naive Method forecast uses the most recent observation as forecast
naive(beer,5)

# Random walk forecast is similar to Naive
rwf(beer,5)

###############################################################
#Simple exponential smoothening forecast method
## Used when there is no trend or seasonality. Uses more weight for recent past.
## Using alpha of 0.1, 0.5 and 0.9 and checking when the RSME (root mean sq error) is lowest
beer1 <- ses(beer,h=25, level = c(80,95), alpha = .1)
summary(beer1)
accuracy(beer1)
autoplot(beer1)

beer5 <- ses(beer,h=25, level = c(80,95), alpha = .5)
summary(beer5)
accuracy(beer1)
autoplot(beer5)

beer9 <- ses(beer,h=10, alpha = .9)
summary(beer9)
accuracy(beer1)
autoplot(beer9)
###############################################################
#Holt's linear trend method
## Good with trending data

###############################################################
#Linear Regression forecast method
head(books)
plot(books)
str(books)
summary(books)
autoplot(books)

### Paperback is dependent, Hardcover is independent. Store results in fit variable
fit <- lm(Paperback ~ Hardcover, data = books)

### Slope is 0.19, Intercept is 147.8
summary(fit)
plot(Paperback ~ Hardcover, data=books, pch =19)
abline(fit)

###############################################################
##############################
# Holt's Seasonal Trend Method
##############################

hw1 <-hw(airpass, seasonal = "additive")
hw2 <-hw(airpass, seasonal = "multiplicative")

autoplot(airpass) +
  autolayer(hw1, series="HW additive forecasts", PI=FALSE) +
  autolayer(hw2, series="HW multiplicative forecasts",
            PI=FALSE) +
  #ggtitle("International visitors nights in Australia") +
  guides(colour=guide_legend(title="Forecast"))
###############################################################

