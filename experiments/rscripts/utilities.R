## Gives count, mean, standard deviation, standard error of the mean, and confidence interval (default 95%).
##   data: a data frame.
##   measurevar: the name of a column that contains the variable1 to be summariezed
##   groupvars: a vector containing names of columns that contain grouping variable1s
##   na.rm: a boolean that indicates whether to ignore NA's
##   conf.interval: the percent range of the confidence interval (default is 95%)
summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=FALSE,
							 conf.interval=.95, .drop=TRUE) {
	library(plyr)
	
	# New version of length which can handle NA's: if na.rm==T, don't count them
	length2 <- function (x, na.rm=FALSE) {
		if (na.rm) sum(!is.na(x))
		else       length(x)
	}
	
	# This does the summary. For each group's data frame, return a vector with
	# N, mean, and sd
	datac <- ddply(data, groupvars, .drop=.drop,
						.fun = function(xx, col) {
							c(N    = length2(xx[[col]], na.rm=na.rm),
							  mean = mean   (xx[[col]], na.rm=na.rm),
							  sd   = sd     (xx[[col]], na.rm=na.rm)
							)
						},
						measurevar
	)
	
	# Rename the "mean" column    
	datac <- rename(datac, c("mean" = measurevar))
	
	datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean
	
	# Confidence interval multiplier for standard error
	# Calculate t-statistic for confidence interval: 
	# e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
	ciMult <- qt(conf.interval/2 + .5, datac$N-1)
	datac$ci <- datac$se * ciMult
	
	return(datac)
}
fancy_scientific <- function(l) {
	# turn in to character string in scientific notation
	l <- format(l, scientific = TRUE)
	# quote the part before the exponent to keep all the digits
	l <- gsub("0e\\+00","0",l)
	l <- gsub("e\\+","e",l)
	l <- gsub("\\'1[\\.0]*\\'\\%\\*\\%", "", l)
	l <- gsub("^(.*)e", "'\\1'e", l)
	# turn the 'e+' into plotmath format
	l <- gsub("e", "%*%10^", l)
	# return this as an expression
	parse(text=l)
}