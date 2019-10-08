library(ggplot2)
library(reshape2)
require(scales)

source("rscripts/consts.R")
source("rscripts/plots.R")

#==============================================================================
# Pre-Processing
#==============================================================================

args = commandArgs(trailingOnly = TRUE)

infile = args[1]
basedir = "./plots"

CPU_FREQ = 400000000

# data <- read.table(file = infile, sep = ";")
data <- read.csv(file = infile, header=TRUE, sep=";")
# colnames(data) <- c("abstraction", "ipc", "kernel", "bufsize", "tcpu", "latency", "volume", "nprocs")

data$abstraction <- as.factor(data$abstraction)
data$kernel      <- as.factor(data$kernel)
data$nclusters   <- data$nioclusters + data$ncclusters
data$latency     <- (data$latency / CPU_FREQ)
data$latency     <- (data$latency / data$nclusters) * MEGA

#---------------------------------------------------------------------------
# Throughput
#---------------------------------------------------------------------------

factor <- "nclusters"
parameter <- "kernel"
variable <- "latency"
group <- "abstraction"

xlabel <- "Number of Processes (Only CClusters)"
xbreaks <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16)
ylabel <- "Broadcast Latency (us)"
labels <- c(paste(data$kernel[1]))

data.filtered <- subset(data, nioclusters == 0)

p <- plot.linespoints(
		data = data.filtered,
		variable = variable,
		factor = factor,
		group = group
	) +
	expand_limits(y = 0) +
	scale_y_continuous(name = ylabel) +
	scale_x_continuous(name = xlabel, breaks = xbreaks) +
	myTheme3
	
if (length(args) != 0) {
	plot.save(basedir, "mailbox-without-io", data$kernel[1], "latency");
}

#---------------------------------------------------------------------------
# Throughput
#---------------------------------------------------------------------------

factor <- "nclusters"
parameter <- "kernel"
variable <- "latency"
group <- "abstraction"

xlabel <- "Number of Processes (With IO1)"
xbreaks <- c(2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17)
ylabel <- "Broadcast Latency (us)"
labels <- c(paste(data$kernel[1]))

data.filtered <- subset(data, nioclusters == 1)

p <- plot.linespoints(
		data = data.filtered,
		variable = variable,
		factor = factor,
		group = group
	) +
	expand_limits(y = 0) +
	scale_y_continuous(name = ylabel) +
	scale_x_continuous(name = xlabel, breaks = xbreaks) +
	myTheme3
	
if (length(args) != 0) {
	plot.save(basedir, "mailbox-with-io", data$kernel[1], "latency");
}
