# Line plot
plot(x1, y1, type = "l", col = "red")
# Dashed line with specified y-value range
plot(x2, y2, type = "lty", col = "blue", ylim = c(0,200))
# Vertical line from a date on x-axis
abline(v=as.Date(c("2000-03-01")), lwd=2)
