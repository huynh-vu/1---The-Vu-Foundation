### In the plots I have included lots of commonly used "extras" so you can see some of the options available.
### You do not need to use anymore than plot([x variable],[y variable]) to get a basic scatter plot and abline(lm([y variable]~[x variable])) to get a basic trend line.


########### Basic Example ##########

X <- c(29, 34, 26, 43, 37, 49, 18, 29, 27, 35)
Y <- c(15, 24, 15, 15, 15, 1, 41, 11, 30, 19)

plot(X,Y,pch=19,col="blue")	#pch changes point shape, col changes the color 
abline(lm(Y~X),col="darkgray",lwd=2)  #adds a trend line (least squares regression line) to the plot, lwd changes line thickness (default is 1)

cor(X,Y)	 #if you ONLY need the sample correlation
cor.test(X,Y)  #for test for whether correlation is 0 (H0) or not 0 (Ha) and CI.  Also gives sample correlation.



########## Anscombe Data ###########

#The Anscombe Quartet data should already be in R as a data frame "anscombe".
#It is one of the pre-loaded datasets in the base library.

anscombe	 #this should just print the dataset so you can make sure it is there and see the variable names.

rbind(mean=apply(anscombe,2,mean),sd=apply(anscombe,2,sd))  #means and sds for datasets

for(i in 1:4) print(cor(anscombe[i],anscombe[i+4]),digits=4)  #loop to print all correlations


par(mfrow = c(2,2))  #divides plot window into a 2x2 matrix of plots to allow us to get all 4 plots together.
for(i in 1:4) { 	 #loop to plot all datasets
	plot(anscombe[[i]],anscombe[[i+4]] ,xlab=paste("x",i,sep=""),ylab=paste("y",i,sep=""),pch=16+i,col=i)  #here you can see point types 17-20 in colors 1-4
	abline(lm(anscombe[[i+4]]~anscombe[[i]]),lty=2)	 #lty changes line type.  There are 6 line types available.
}



