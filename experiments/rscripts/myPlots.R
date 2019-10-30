#===============================================================================
# Utilities
#===============================================================================

#
# @brief Save a plot into a file.
#
# @param directory Output directory.
# @param filename  Output filename.
# @param plot      Target plot.
# @param width     Plot width.
# @param height    Plot height.
#
plot.save <- function(
	directory = getwd(),
	filename = "plot.pdf",
	plot, width = 6, height = 2.8
) {
	filename <- paste(directory, filename, sep = "/")
	filename <- paste(filename, "pdf", sep = ".")

	ggsave(
		filename = filename,
		plot = plot,
		width = width,
		height = height
	)
}

#===============================================================================
# Stacked Bars Plot
#===============================================================================

plot.stacked.bars <- function(
	df,
	factor, respvar, param,
	title, subtitle = NULL,
	legend.title, legend.labels,
	axis.x.title, axis.x.labels = NULL,
	axis.y.title, axis.y.limits = NULL,
	axis.y.trans = 'identity',
	axis.y.trans.fn = function(x) x,
	axis.y.breaks = trans_breaks(axis.y.trans,  axis.y.trans.fn),
	axis.y.trans.format = math_format()(1:10))
{
	ggplot(
		data = df,
		aes(x = get(factor), y = get(respvar), fill = get(param))
	) +
		geom_bar(stat="identity",
				 position = position_stack(reverse = TRUE),
				 width = 0.5, colour = "black") +
		geom_text(
			aes(label = round(get(respvar), digits = 0)),
			vjust = -0.5,
			size=3.5
		) +
		labs(
			title = title,
			subtitle = subtitle,
			x = axis.x.title,
			y = axis.y.title,
			fill = legend.title
		) +
		scale_y_continuous(
			expand = c(0, 0),
			limits = axis.y.limits,
			trans = axis.y.trans,
			breaks = axis.y.breaks,
			labels = trans_format(axis.y.trans, axis.y.trans.format)
		) +
		scale_x_discrete(
			labels = axis.x.labels
		) +
		scale_fill_grey(
			labels = legend.labels
		) +
		theme_classic()
}

#===============================================================================
# Bars Plot
#===============================================================================

plot.bars <- function(
  df,
  factor, respvar, param,
  title, subtitle = NULL,
  legend.title, legend.labels,
  axis.x.title, axis.x.labels = NULL,
  axis.y.title, axis.y.limits = NULL,
  axis.y.trans = 'identity',
  axis.y.trans.fn = function(x) x,
  axis.y.breaks = trans_breaks(axis.y.trans,  axis.y.trans.fn),
  axis.y.trans.format = math_format()(1:10))
{
  ggplot(
      data = df,
      aes(x = get(factor), y = get(respvar), fill = get(param))
    ) +
    geom_bar(stat="identity", width = 0.5, colour = "black") +
    geom_text(
      aes(label = round(get(respvar), digits = 0)),
      vjust = -0.5,
      size=3.5
    ) +
    labs(
    title = title,
	subtitle = subtitle,
    x = axis.x.title,
      y = axis.y.title,
      fill = legend.title
    ) +
    scale_y_continuous(
      expand = c(0, 0),
      limits = axis.y.limits,
      trans = axis.y.trans,
      breaks = axis.y.breaks,
      labels = trans_format(axis.y.trans, axis.y.trans.format)
    ) +
    scale_x_discrete(
      labels = axis.x.labels
    ) +
    scale_fill_grey(
      labels = legend.labels
    ) +
    theme_classic()
}

#===============================================================================
# Linespoint Plot
#===============================================================================

myTheme <- theme(
	# Legend
	legend.title = element_text(size = 10, color = 'black'),
	legend.text = element_text(size = 10, color = 'black'),
	legend.justification = c(1.0, 0.0),
	legend.position = c(0.98, 0.02),
	legend.background = element_rect(fill="white",size=0.5, linetype="solid",colour ="black"),
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

myTheme2 <- theme (
	# Legend
	legend.title = element_blank(),
	legend.text = element_text(size = 10, color = 'black'),
	legend.justification = c(0.0, 1.0),
	legend.position = c(0.02, 0.98),
	legend.background = element_rect(fill="white", size=0.5, linetype="solid", colour ="black"),

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

myTheme3 <- theme (
	# Legend
	legend.title = element_blank(),
	legend.text = element_text(size = 10, color = 'black'),
	legend.justification = c(1.0, 1.0),
	legend.position = c(0.98, 0.98),
	legend.background = element_rect(fill="white", size=0.5, linetype="solid", colour ="black"),
	
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

outsideTheme <- theme (
	# Legend
	legend.title = element_blank(),
	legend.text = element_text(size = 10, color = 'black'),
	legend.justification = c(1.0, 1.0),
	# legend.position = c(1.1, 0.98),
	legend.position="right",
	legend.background = element_rect(fill="white", size=0.5, linetype="solid", colour ="black"),

	# Not clip the legend
	# par(xpd=TRUE),
	
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

plot.linespoint <- function(
  df,
  factor, respvar, param,
  title, subtitle = NULL,
  legend.title, legend.labels,
  axis.x.title, axis.x.breaks,
  axis.x.trans = 'identity',
  axis.y.title, axis.y.limits = NULL,
  axis.y.trans = 'identity',
  axis.y.trans.fn = function(x) x,
  axis.y.breaks = trans_breaks(axis.y.trans,  axis.y.trans.fn),
  axis.y.trans.format = math_format()(1:10))
{
ggplot(
    data = df,
    aes(x = get(factor), y = get(respvar), group = get(param))
  ) +
	geom_line() +
	geom_point(
		aes(shape = get(param)),
		fill = "black"
	) +
	geom_errorbar(aes(ymin = get(respvar) - cv, ymax = get(respvar) + cv),
					width = 0.1
	) +
  labs(
    title = title,
    subtitle = subtitle,
    x = axis.x.title,
    y = axis.y.title
  ) +
  scale_shape_manual(
    name = legend.title,
    labels = legend.labels,
	values = c(21, 22, 23, 24, 25)

  ) +
  scale_x_continuous(
    breaks = axis.x.breaks,
	trans = axis.x.trans
  ) +
  scale_y_continuous(
    expand = c(0, 0),
    limits = axis.y.limits,
    trans = axis.y.trans,
    breaks = axis.y.breaks
    # labels = trans_format(axis.y.trans, axis.y.trans.format)
  ) +
  theme_classic()
}
