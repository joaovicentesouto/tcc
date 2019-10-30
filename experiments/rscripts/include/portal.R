
#===============================================================================
# Benchmark Information
#===============================================================================

if (!exists(script.variant)) {
	script.variant <- "all"
}

benchmark.id                <- "portal"
benchmark.name              <- "Portal Benchmark"
benchmark.dataset.directory <- "./cooked"
benchmark.dataset.file      <- paste0(paste0("portal-", script.variant), ".csv")

#-------------------------------------------------------------------------------
# Benchmark Parameters
#-------------------------------------------------------------------------------

# benchmark.params.nthreads.min  <- 1
# benchmark.params.nthreads.max  <- 14
# benchmark.params.nthreads.step <- 1

#-------------------------------------------------------------------------------
# Benchmark Variables
#-------------------------------------------------------------------------------

benchmark.variables.id   <- c("buffersize", "kernel")
benchmark.variables.name <- c("Buffer Size (KB)", "Routine")

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

data.raw$buffersize  <- data.raw$buffersize / KB
data.raw$latency     <- data.raw$latency / MPPA.FREQ
data.raw$throughput  <- (data.raw$volume / data.raw$latency) / MB

#===============================================================================
# Pre-Processing
#===============================================================================

# Removes unnecessary columns
data.filtered <- select(data.raw, -c(abstraction,nioclusters,ncclusters,latency,volume))

data.melted <- melt(data = data.filtered, id.vars = benchmark.variables.id)

data.digested <- ddply(
	data.melted,
	c(benchmark.variables.id, "variable"),
	summarise,
	mean = mean(value),
	sd = sd(value),
	cv = sd(value)/mean(value)
)
