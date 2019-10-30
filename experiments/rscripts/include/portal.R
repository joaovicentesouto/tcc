#===============================================================================
# Benchmark Information
#===============================================================================

benchmark.id                <- "portal"
benchmark.name              <- "Portal Benchmark"
benchmark.dataset.directory <- "./cooked"
benchmark.dataset.file      <- "portal.csv"

#-------------------------------------------------------------------------------
# Benchmark Parameters
#-------------------------------------------------------------------------------

# benchmark.params.nthreads.min  <- 1
# benchmark.params.nthreads.max  <- 14
# benchmark.params.nthreads.step <- 1

#-------------------------------------------------------------------------------
# Benchmark Variables
#-------------------------------------------------------------------------------

benchmark.variables.id <- c("buffersize", "kernel")
benchmark.variables.name <- c("Buffer Size (in KB)", "Kernel")

#===============================================================================
# Setup
#===============================================================================

infile <- paste(
	benchmark.dataset.directory,
	benchmark.dataset.file,
	sep = "/"
)

data.raw <- read.table(file = infile, sep = ";", header = TRUE)

#==============================================================================
# Pre-Processing
#==============================================================================

# data.raw$abstraction <- as.factor(data.raw$abstraction)
# data.raw$kernel      <- as.factor(data.raw$kernel)
data.raw$buffersize  <- data.raw$buffersize / KB
data.raw$latency     <- data.raw$latency / MPPA.FREQ
data.raw$throughput  <- (data.raw$volume / data.raw$latency) / MB

#===============================================================================
# Pre-Processing
#===============================================================================

data.filtered <- data.raw

data.melted <- melt(data = data.filtered, id.vars = benchmark.variables.id)

data.digested <- ddply(
	data.melted,
	c(benchmark.variables.id, "variable"),
	summarise,
	mean = mean(value),
	sd = sd(value),
	cv = sd(value)/mean(value)
)
