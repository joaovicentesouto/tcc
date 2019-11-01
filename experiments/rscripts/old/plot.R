library(ggplot2)

source("rscripts/utilities.R")

palettePaper <- c("#b2182b","#2166ac","#ef8a62","#67a9cf","#fddbc7","#d1e5f0")	
palette <- c("grey10", "grey 40", "grey70")	

plot.linespoints <- function(data, variable, factor, group) {
	x <- summarySE(data, measurevar = variable, groupvars = c(factor, group))
	p <- ggplot(data = x,
				aes(x = get(factor),
					y = get(variable),
					colour = get(group),
					shape = get(group)
				)
		) +
		geom_line() +
		geom_point(size = 2) +
		geom_errorbar(aes(ymin = get(variable) - ci, ymax = get(variable) + ci),
					  width = 0.1
		) +
		scale_shape_discrete(labels = labels) +
		scale_color_manual(labels = labels, values = palette) +
		labs(x = factor, y = variable, size = 10)
	
	return (p)
}


myTheme <- theme_classic() +
			theme (
			# Legend
			legend.title = element_blank(),
			legend.text = element_text(size = 10, color = 'black'),
			legend.justification = c(1.0, 0.0),
			legend.position = c(0.98, 0.02),
			legend.background = element_rect(fill="white",
							 size=0.5, linetype="solid", 
							 colour ="black"),
			# X Axis
			axis.text.x = element_text(size = 10, color = 'black'),
			axis.title.x = element_text(size = 12, color = 'black', margin = margin(t = 10, r = 0, b = 0, l = 0)),
			# Y Axis
			axis.text.y = element_text(size = 10, color = 'black'),
			axis.title.y = element_text(size = 12, color = 'black', margin = margin(t = 0, r = 5, b = 0, l = 0)),
			# Grid
			panel.border = element_rect(colour = "black", fill = NA, size = 1),
			panel.grid.major = element_line(color = 'gray', size = 0.2, linetype = 'dashed'), 
			panel.grid.minor = element_line(color = 'gray', size = 0.1, linetype = 'dashed')
		)

myTheme2 <- theme_classic() +
	theme (
			# Legend
			legend.title = element_blank(),
			legend.text = element_text(size = 10, color = 'black'),
			legend.justification = c(0.0, 1.0),
			legend.position = c(0.02, 0.98),
			legend.background = element_rect(fill="white",
							 size=0.5, linetype="solid", 
							 colour ="black"),
			# X Axis
			axis.text.x = element_text(size = 10, color = 'black'),
			axis.title.x = element_text(size = 12, color = 'black', margin = margin(t = 10, r = 0, b = 0, l = 0)),
			# Y Axis
			axis.text.y = element_text(size = 10, color = 'black'),
			axis.title.y = element_text(size = 12, color = 'black', margin = margin(t = 0, r = 5, b = 0, l = 0)),
			# Grid
			panel.border = element_rect(colour = "black", fill = NA, size = 1),
			panel.grid.major = element_line(color = 'gray', size = 0.2, linetype = 'dashed'), 
			panel.grid.minor = element_line(color = 'gray', size = 0.1, linetype = 'dashed')
		)

myTheme3 <- theme_classic() +
	theme (
			# Legend
			legend.title = element_blank(),
			legend.text = element_text(size = 10, color = 'black'),
			legend.justification = c(0.0, 1.0),
			legend.position = c(0.50, 0.98),
			legend.background = element_rect(fill="white",
							 size=0.5, linetype="solid", 
							 colour ="black"),
			# X Axis
			axis.text.x = element_text(size = 10, color = 'black'),
			axis.title.x = element_text(size = 12, color = 'black', margin = margin(t = 10, r = 0, b = 0, l = 0)),
			# Y Axis
			axis.text.y = element_text(size = 10, color = 'black'),
			axis.title.y = element_text(size = 12, color = 'black', margin = margin(t = 0, r = 5, b = 0, l = 0)),
			# Grid
			panel.border = element_rect(colour = "black", fill = NA, size = 1),
			panel.grid.major = element_line(color = 'gray', size = 0.2, linetype = 'dashed'), 
			panel.grid.minor = element_line(color = 'gray', size = 0.1, linetype = 'dashed')
		)
#
# @brief Save a plot into a file.
#
# @param basedir       Base directory.
# @param bariable.name Name of the variable.
# @param kernel.name   Name of the kernel.
# @param metric.name   Name of the metric.
#
plot.save <- function(basedir, variable.name, kernel.name, metric.name) {
	filename <- paste(basedir, variable.name, sep = "/")
	filename <- paste(filename, kernel.name, sep = "-")
	metric.name <- paste(metric.name, "pdf", sep = ".")
	filename <- paste(filename, metric.name, sep = "-")
	ggsave(
		filename = filename,
		plot = p,
		width = 3.2,
		height = 2.8
	)
}