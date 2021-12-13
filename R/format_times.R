#' Remove leading zero
#'
#' Removes the first zero in a string
#'
#' @param string String to remove leading zeros from
#' @export
remove_leading_zero <- function(string) {
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
  remove_leading_zero(out)
}

#' Format times
#'
#' Create a character vector with meeting start and end times in different time
#' zones.
#'
#' @param meeting_date The date of the meeting in ISO 8601 format (i.e.,
#'   "YYYY-MM-DD")
#' @param start_time String with the start time in the time zone \code{tzone}.
#'   Use 24-hour time. (I.e., "13:00" not "1:00 PM").
#' @param end_time String with the start time in the time zone \code{tzone}. Use
#'   24-hour time.
#' @param tzone the time zone that the start and end times are in see the link
#'   in \code{tzones} for names to use.
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

#' Format date
#'
#' @param date_in The date to input in ISO 8601, e.g., "2021-12-13"
#' @param format Date format to use, see \code{\link[base]{strptime}}
#' @export
format_date <- function(date_in, format = "%A %B %d, %Y") {
  date_out <- as.Date(date_in)
  date_out <- format(date_out, format)
  date_out <- remove_leading_zero(date_out)
  return(date_out)
}

