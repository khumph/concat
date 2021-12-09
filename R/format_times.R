#' Remove leading zeros
#'
#' @param string String to remove leading zeros from
remove_leading_zeros <- function(string) {
  gsub("(?<=\\s|^)0", "", string, perl = TRUE)
}

#' Format output time
#'
#' @param time Time
#' @param tzone Time zone
format_time <- function(time, tzone) {
  format(lubridate::with_tz(time, tzone = tzone), "%I:%M %p %Z")
}

#' Print meeting duration
#'
#' @param start_time Meeting start date & time
#' @param end_time Meeting end date & time
#' @param tzone The time zone to display the meeting start and end times
format_duration <- function(tzone, start_time, end_time) {
  out <- paste(format_time(start_time, tzone), "-", format_time(end_time, tzone))
  remove_leading_zeros(out)
}

#' Format times
#'
#' Create a character vector with meeting start and end times in different time
#' zones.
#'
#' @param start_time String with the start time in the time zone \code{tzone}.
#'   Use 24-hour time. (I.e., "13:00" not "1:00 PM").
#' @param end_time String with the start time in the time zone \code{tzone}. Use
#'   24-hour time.
#' @param tzones The time zones you wish to display. See
#'   \url{https://en.wikipedia.org/wiki/List_of_tz_database_time_zones} for time
#'   zone names you can use.
#'
#' @examples
#' format_times("2021-07-02", "7:00", "9:00", "America/Los_Angeles",
#'  c("America/Los_Angeles", "America/New_York", "Europe/London"))
#' @export
format_times <- function(meeting_date, start_time, end_time, tzone, tzones) {
  start <- as.POSIXlt(paste(meeting_date, start_time), tz = tzone)
  end <- as.POSIXlt(paste(meeting_date, end_time), tz = tzone)

  times <- lapply(tzones, format_duration, start, end)
  out <- unlist(times)
  names(out) <- tzones
  return(out)
}
