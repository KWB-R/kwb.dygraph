# addEventShades ---------------------------------------------------------------
#' add shaded areas representing time intervals within "events"
#'
#' @param dygraph dygraph object as returned by \link[dygraphs]{dygraph}
#' @param events data frame with columns \emph{tBeg} (begin time) and \emph{tEnd}
#' (end time) of events to be drawn
#' @param color color (default: "lightgrey")
#' @param signalWidth signal width in seconds = length of time interval that one
#' timestamp in the original data represents, e.g. 300 for 5-minutes-data
#'
#' @return modified dygraph object
#' @export
#'
#' @importFrom kwb.event hsSigWidth
#' @importFrom dygraphs dyShading
addEventShades <- function
(
  dygraph,
  events,
  color = "lightgrey",
  signalWidth = kwb.event::hsSigWidth(events)
)
{
  for (i in seq_len(nrow(events))) {
    dygraph <- dygraphs::dyShading(
      dygraph = dygraph,
      from = events$tBeg[i],
      to = events$tEnd[i] + signalWidth,
      color = color
    )
  }

  dygraph
}

# addEventLines ----------------------------------------------------------------
#'  add lines to dygrap plot representing begin and end of events
#'
#' @param dygraph  dygraph object as returned by \link[dygraphs]{dygraph}
#' @param events data frame with columns \emph{tBeg} (begin time) and \emph{tEnd}
#' (end time) of events to be drawn
#' @param labels labels given to the events (default: \code{1:nrow(events)})

#' @param color color (default: "red")
#' @param labelLoc  "top" or "bottom" (default: "top")
#' @param color.begin default: same as argument "color"
#' @param color.end default: same as argument "color"
#' @param labelLoc.begin default: same as argument "labelLoc"
#' @param labelLoc.end default: same as argument "labelLoc"
#' @param signalWidth  signal width in seconds = length of time interval that
#' one timestamp in the original data represents, e.g. 300 for 5-minutes-data.
#'
#' @return modified dygraph object
#' @export

addEventLines <- function # addEventLines
(
  dygraph,
  events,
  labels = seq_len(nrow(events)),
  color = "red",
  labelLoc = "top",
  color.begin = color,
  color.end = color,
  labelLoc.begin = labelLoc,
  labelLoc.end = labelLoc,
  signalWidth = kwb.event::hsSigWidth(events)
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
#' call dygraphs::dyEvent repeatedly
#'
#' @param dygraph Dygraph to add event line to
#' @param dates vector of Date/time for the event (must be a POSIXct object or
#' another object convertible to POSIXct via as.POSIXct)
#' @param labels vector of labels for the events. (default: "")
#' @param labelLocs vector of locations for the labels ("top" or "bottom").
#' default: c("top", "bottom")
#' @param colors vector of colors for each event line. This can be of the
#' form "#AABBCC" or "rgb(255,100,200)" or "yellow". Defaults to black.
#' @param strokePatterns  vector of predefined stroke pattern types ("dotted",
#' "dashed", or "dotdash")
#'
#' @return modified dygraph object
#' @export
#' @importFrom  kwb.utils recycle
#' @importFrom dygraphs dyEvent
#'
dyEvents <- function
(
  dygraph,
  dates,
  labels = "",
  labelLocs = c("top", "bottom"),
  colors = "black",
  strokePatterns = "dashed"
)
{
  n <- length(dates)

  # Recycle all vectors to the length of dates
  labels <- kwb.utils::recycle(labels, n)
  labelLocs <- kwb.utils::recycle(labelLocs, n)
  colors <- kwb.utils::recycle(colors, n)
  strokePatterns <- kwb.utils::recycle(strokePatterns, n)

  for (i in seq_along(dates)) {

    dygraph <- dygraphs::dyEvent(
      dygraph = dygraph,
      x = dates[i],
      label = labels[i],
      labelLoc = labelLocs[i],
      color = colors[i]
    )
  }

  dygraph
}
