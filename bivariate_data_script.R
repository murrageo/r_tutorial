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

