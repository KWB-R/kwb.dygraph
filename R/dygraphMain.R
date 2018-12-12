# addEventShades ---------------------------------------------------------------
addEventShades <- function # addEventShades
### add shaded areas representing time intervals within "events"
(
  dygraph, 
  ### dygraph object as returned by \code{dygraph}
  events, 
  ### data frame with columns \emph{tBeg} (begin time) and \emph{tEnd}
  ### (end time) of events to be drawn
  color = "lightgrey",
  signalWidth = hsSigWidth(events)
  ### signal width in seconds = length of time interval that one timestamp
  ### in the original data represents, e.g. 300 for 5-minutes-data
) 
{
  for (i in seq_len(nrow(events))) {
    dygraph <- dyShading(
      dygraph = dygraph, 
      from = events$tBeg[i], 
      to = events$tEnd[i] + signalWidth, 
      color = color
    )
  }
  
  dygraph
}

# addEventLines ----------------------------------------------------------------
addEventLines <- function # addEventLines
### add lines to dygrap plot representing begin and end of events
(
  dygraph, 
  ### dygraph object as returned by \code{dygraph}
  events, 
  ### data frame with columns \emph{tBeg} (begin time) and \emph{tEnd}
  ### (end time) of events to be drawn  
  labels = seq_len(nrow(events)),
  ### labels given to the events (default: \code{1:nrow(events)})
  color = "red", 
  ### default: "red"
  labelLoc = "top",
  ### "top" or "bottom" (default: "top")
  color.begin = color, 
  color.end = color,
  labelLoc.begin = labelLoc, 
  labelLoc.end = labelLoc,
  signalWidth = hsSigWidth(events)
  ### signal width in seconds = length of time interval that one timestamp
  ### in the original data represents, e.g. 300 for 5-minutes-data  
)
{
  # add begin lines (label on bottom)
  dygraph <- dyEvents(
    dygraph = dygraph, 
    dates = events$tBeg, 
    labels = paste("Begin", labels), 
    labelLocs = labelLoc.begin, 
    colors = color.begin
  )
  
  # add end lines (label on top)
  dygraph <- dyEvents(
    dygraph = dygraph, 
    dates = events$tEnd + signalWidth, 
    labels = paste("End", labels), 
    labelLocs = labelLoc.end, 
    colors = color.end
  )
  
  dygraph
}

# dyEvents ---------------------------------------------------------------------
dyEvents <- function # dyEvents
### call dygraphs::dyEvent repeatedly
(
  dygraph,
  ### Dygraph to add event line to  
  dates,
  ### vector of Date/time for the event (must be a POSIXct object or another
  ### object convertible to POSIXct via as.POSIXct).  
  labels = "",
  ### vector of labels for the events.  
  labelLocs = c("top", "bottom"),
  ### vector of locations for the labels ("top" or "bottom").  
  colors = "black",
  ### vector of colors for each event line. This can be of the form "#AABBCC" or
  ### "rgb(255,100,200)" or "yellow". Defaults to black.  
  strokePatterns = "dashed"
  ### vector of predefined stroke pattern types ("dotted", "dashed", or
  ### "dotdash")
)
{
  n <- length(dates)
  
  # Recycle all vectors to the length of dates
  labels <- kwb.utils::recycle(labels, n)
  labelLocs <- kwb.utils::recycle(labelLocs, n)
  colors <- kwb.utils::recycle(colors, n)
  strokePatterns <- kwb.utils::recycle(strokePatterns, n)
  
  for (i in seq_along(dates)) {
    
    dygraph <- dyEvent(
      dygraph = dygraph, 
      x = dates[i], 
      label = labels[i], 
      labelLoc = labelLocs[i], 
      color = colors[i]
    )
  }
  
  dygraph
}
