#
# MIT License
#
# Copyright (c) 2011-2018 Pedro Henrique Penna <pedrohenriquepenna@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.  THE SOFTWARE IS PROVIDED
# "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
# LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
# PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

# R Libraries
library(ggplot2)
library(scales)
library(reshape2)
library(plyr)
library(dplyr, warn.conflicts = FALSE)

# My Utilities
source("./rscripts/consts.R")
source("./rscripts/myPlots.R")

print("ABC")

source("./rscripts/include/portal.R")

print("DEF")

#==============================================================================
# Build
#==============================================================================


args = commandArgs(trailingOnly = TRUE)

# TODO: properly parse command line arguments.
script.params.plotTitles <- TRUE
if (length(args) == 0) {
	script.params.plotTitles <- FALSE
}

#===============================================================================
# Time Scalability Plot
#===============================================================================

plot.variable.id  <- benchmark.variables.id

plot.factors.id <- c(
	"throughput"
)

plot.factors.name <- c(
	"Throughput (in MB/s)"
)

# Build Plot Data Frame
plot.df <- subset(
	data.digested,
	variable %in% plot.factors.id
)
# plot.df$mean <- plot.df$mean/KILO
# plot.df$sd <- plot.df$sd/KILO

# Plot Titles
if (script.params.plotTitles) {
	plot.title <- benchmark.name
	plot.subtitle <- paste("Portal Throughput")
} else {
	plot.title <- NULL
	plot.subtitle <- NULL
}

# X Axis
plot.axis.x.title <- benchmark.variables.name
# plot.axis.x.breaks <- seq(
# 	from = benchmark.params.nthreads.min,
# 	to   = benchmark.params.nthreads.max,
# 	by   = benchmark.params.nthreads.step
# )
plot.axis.x.breaks <- c(4, 8, 16, 32, 64)

# Y Axis
plot.axis.y.title <- bquote("Throughput (MB/s)")
# plot.axis.y.limits <- c(min(data.filtered$throughput), max(data.filtered$throughput))
plot.axis.y.breaks <- c(4, 8, 16, 32, 64, 128, 256, 512)
plot.axis.y.limits <- c(4, 512)

# Legend
plot.legend.title <- NULL
plot.legend.labels <- c("allgather", "broadcast", "gather", "pingpong", "scatter")

plot <- plot.linespoint(
	df = plot.df,
	factor = plot.variable.id[1], respvar = "mean", param = plot.variable.id[2],
	title = plot.title, subtitle = plot.subtitle,
	legend.title = plot.legend.title, legend.labels = plot.legend.labels,
	axis.x.title = plot.axis.x.title, axis.x.breaks = plot.axis.x.breaks, axis.x.trans = 'log2',
	axis.y.title = plot.axis.y.title, axis.y.limits = plot.axis.y.limits, axis.y.breaks = plot.axis.y.breaks, axis.y.trans = 'log2'
) +  myTheme + theme(legend.title = element_blank())

plot.save(
	directory = paste("./img", sep = "/"),
	filename  = paste(benchmark.id, "throughput", sep = "-"),
	plot
)
