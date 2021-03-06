# packages
install.packages("UsingR")
install.packages("aplpack")
require("UsingR")
require("MASS")
require("stats")
data("michelson")

# the effect of beets on atheletic performance
beets <- c(41, 40, 41, 42, 44, 35, 41, 36, 47, 45)
no_beets <- c(51, 51, 50, 42, 40, 31, 43, 45)
c(xbar1=mean(beets), xbar2=mean(no_beets),
  sd1=sd(beets), sd2=sd(no_beets))

# boxplots
boxplot(no_beets, beets, names = c("no beets", "beets"), horizontal = TRUE)

# density plot
speed <- michelson$Speed; expt <- michelson$Expt
fourth <- speed[expt ==4]
fifth <- speed[expt == 5]
d_4 <- density(fourth)
d_5 <- density(fifth)
xrange <- range(c(d_4$x, d_5$x))
yrange <- range(c(d_4$y, d_5$y))
plot(d_4, xlim=xrange, ylim=yrange, xlab = "densities", main="")
lines(d_5, lty=2)
legend(650, 0.008, legend=c("Fourth", "Fifth", lty=c(1,2)))

# quantile normal plot
qqplot(fourth, fifth)

ps <- seq(0.05, 0.95, by = 0.05)
x <- quantile(fourth, ps)
y <- quantile(fifth, ps)
plot(x, y)

# problems
## problem 3.1: The ToothGrowth data set contains measurements of tooth length (len)
## for different treatments of supplement type (supp). Break the data up by the two
## types and compare the two resulting variables. Use boxplots.

### reading in data
data("ToothGrowth")
### data rearrangement
tooth_length <- ToothGrowth$len; supplement <- ToothGrowth$supp
VC <- tooth_length[supplement == "VC" ]
OJ <- tooth_length[supplement == "OJ"]
c(xbar1=mean(VC), xbar2=mean(OJ),
  sd1=sd(VC), sd2=sd(OJ))
### compare with boxplots
boxplot(VC, OJ, names = c("supp_vc", "supp_oj"), horizontal = TRUE)

## problem 3.2: For the michelson (MASS) data set, produce a graphic with a density
## plot for experiments 1 and 2.
speed <- michelson$Speed; expt <- michelson$Expt
first <- speed[expt == 1]
second <- speed[expt == 2]
d_1 <- density(first)
d_2 <- density(second)
xrange2 <- range(c(d_1$x, d_2$x))
yrange2 <- range(c(d_1$y, d_2$y))
plot(d_1, xlim=xrange2, ylim=yrange2, xlab = "densities", main="")
lines(d_2, lty=2)
legend(650, 0.008, legend=c("First", "Second", lty=c(1,2)))

## problem 3.3: Use a qqplot to answer if the rivers and the islands data sets have
## a similar shape (both are skewed right.)

### loading data
data("rivers")
data("islands")

# density plots
d_r <- density(rivers)
d_i <- density(islands)
xrange3 <- range(c(d_r$x, d_i$x))
yrange3 <- range(c(d_r$y, d_i$y))
plot(d_r, xlim=xrange3, ylim=yrange3, xlab = "densities", main="")
lines(d_i, lty=2)
# quantile normal plot
qqplot(rivers, islands)

# 3.2 Data Manipulation Basics

#creating a list to store the beets data
b <- list(beets = beets, "no beets" = no_beets)
b
# access component of list by name
b$beets
# return list
b[1]
# return component
b[[1]]

boxplot(b)

# side by side lists as boxplots
speeds <- 