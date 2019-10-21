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
data$buffersize  <- data$buffersize / KB
data$latency     <- data$latency / CPU_FREQ
data$throughput  <- (data$volume / data$latency) / MB
data$nclusters   <- data$nioclusters + data$ncclusters

data <- subset(data, nclusters == 17)

#---------------------------------------------------------------------------
# Throughput
#---------------------------------------------------------------------------

factor <- "buffersize"
parameter <- "kernel"
variable <- "throughput"
group <- "abstraction"

xlabel <- "Transfer Size (kB)"
xbreaks <- c(4, 8, 16, 32, 64)
ylabel <- "Read Throughput (MB/s)"
labels <- c(paste(data$kernel[1]))

data.filtered <- data

p <- plot.linespoints(
		data = data.filtered,
		variable = variable,
		factor = factor,
		group = group
	) +
	expand_limits(y = 0) +
	scale_y_continuous(name = ylabel) +
	scale_x_continuous(name = xlabel, trans = "log2", breaks = xbreaks) +
	myTheme
	
if (length(args) != 0) {
	plot.save(basedir, "portal", data$kernel[1], "throughput");
}
