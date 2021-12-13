#' Generate cover page LaTeX string
#'
#' @param study The name of the study, e.g., "Sponsor Protocol"
#' @param report_title The title of the report, e.g., "Open Report"
#' @param purpose E.g., "DMC Meeting"
#' @param mtg_type What kind of meeting is it? E.g., "Teleconference"
#' @param mtg_date The date of the meeting in ISO 8601 E.g., "Friday, December 10, 2021"
#' @param mtg_times Character vector of meeting times, E.g., c("7:00 AM - 10:00 AM PST", "10:00 AM - 1:00 PM EST")
#' @param cutoff_snapshot "Cutoff" if cutoff date is used "Snapshot" if snapshot date is used
#' @param dco_date Data cutoff or snapshot date E.g., "November 10, 2021"
#' @export
paste_cover_tex <- function(study, report_title, purpose, mtg_type, mtg_date,
                          mtg_times, cutoff_snapshot, dco_date, conf_statement) {

  output <- paste0("
% Cover Page ----------------------------------------------------------------
\\begin{titlepage}
\\begin{center}
{\\huge \\bfseries

", study, "

\\vfill

", report_title, "

\\vfill

", purpose, "

", mtg_type, "

\\vfill

", mtg_date, "\n\n",

paste(mtg_times, collapse = "\n\n"),
"

}

\\vfill

Data ", cutoff_snapshot, " Date: ", dco_date, "

\\vfill

\\textbf{Confidentiality Statement}

", conf_statement ,"

\\end{center}
\\end{titlepage}

% ----------------------------------------------------------------------------
")
  return(output)
}


#' Generate cover page LaTeX string
#'
#' @param study The name of the study, e.g., "Sponsor Protocol"
#' @param report_title The title of the report, e.g., "Open Report"
#' @param purpose E.g., "DMC Meeting"
#' @param mtg_type What kind of meeting is it? E.g., "Teleconference"
#' @param mtg_date The date of the meeting in ISO 8601 format, e.g.,
#'   "2021-12-10".
#' @param start_time String with the start time in the time zone \code{tzone}.
#'   Use 24-hour time. (I.e., "07:00" not "7:00" and "13:00" not "1:00 PM").
#' @param end_time String with the start time in the time zone \code{tzone}. Use
#'   24-hour time.
#' @param tzone The time zone that the start and end times are in see the link
#'   in \code{tzones} for names to use.
#' @param tzones The time zones you wish to display. See
#'   \url{https://en.wikipedia.org/wiki/List_of_tz_database_time_zones} for time
#'   zone names you can use.
#' @param cutoff_snapshot "Cutoff" if cutoff date is used "Snapshot" if snapshot date is used.
#' @param dco_date Data cutoff or snapshot date in ISO 8601, e.g., "2021-11-10".
#' @param conf_statement Statement of confidentiality.
#' @export
gen_cover_tex <- function(study, report_title, purpose, mtg_type, mtg_date,
                          start_time, end_time, tzone, tzones, cutoff_snapshot,
                          dco_date, conf_statement) {
  mtg_date_out <- format_date(mtg_date, "%A %B %d, %Y")
  dco_date_out <- format_date(dco_date, "%B %d, %Y")
  mtg_times <- format_times(mtg_date, start_time, end_time, tzone, tzones)
  paste_cover_tex(study, report_title, purpose, mtg_type, mtg_date_out,
                          mtg_times, cutoff_snapshot, dco_date_out, conf_statement)
}
