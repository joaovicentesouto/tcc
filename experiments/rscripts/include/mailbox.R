
#===============================================================================
# Benchmark Information
#===============================================================================

if (!exists(script.variant)) {
	script.variant <- "essential"
}

benchmark.id                <- "mailbox"
benchmark.name              <- "Mailbox Benchmark"
benchmark.dataset.directory <- "./cooked"
benchmark.dataset.file      <- paste0(paste0("mailbox-", script.variant), ".csv")

#-------------------------------------------------------------------------------
# Benchmark Parameters
#-------------------------------------------------------------------------------

# benchmark.params.nthreads.min  <- 1
# benchmark.params.nthreads.max  <- 14
# benchmark.params.nthreads.step <- 1

#-------------------------------------------------------------------------------
# Benchmark Variables
#-------------------------------------------------------------------------------

benchmark.variables.id   <- c("ncclusters", "kernel")
benchmark.variables.name <- c("Number of Slaves", "Routine")

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

# Convert latency to miliseconds
data.raw$latency     <- (data.raw$latency / MPPA.FREQ) * KILO

# Throughput of the mailbox
# data.raw$buffersize  <- data.raw$buffersize / KB
# data.raw$latency     <- data.raw$latency / MPPA.FREQ
# data.raw$throughput  <- (data.raw$volume / data.raw$latency) / MB

#===============================================================================
# Pre-Processing
#===============================================================================

# Removes unnecessary columns
data.filtered <- select(data.raw, -c(abstraction,nioclusters,buffersize,volume))

data.melted <- melt(data = data.filtered, id.vars = benchmark.variables.id)

data.digested <- ddply(
	data.melted,
	c(benchmark.variables.id, "variable"),
	summarise,
	mean = mean(value),
	sd = sd(value),
	cv = sd(value)/mean(value)
)
