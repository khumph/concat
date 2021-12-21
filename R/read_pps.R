#' Read PPS
#'
#' @param path_xlsx Path to the PPS
read_pps <- function(path_xlsx) {
  pps <- readxl::read_excel(path_xlsx, sheet = "TLFs", skip = 1)
  return(pps)
}

#' Format PPS
#'
#' @param pps Data frame of the unformatted PPS
#' @param open_closed String that identifies which report to produced. Usually
#'   "open" or "closed"
#' @param path_prod Path to the folder that has the subfolders of the outputs to
#'   produce
format_pps <- function(pps, open_closed, path_prod) {
  pps_out <- pps
  names(pps_out) <- tolower(gsub("(\\s|\\.\\.\\.|\\(|\\/)+", "_", names(pps)))
  pps_out <- pps_out[pps_out$suffix == open_closed, ]
  out <- pps_out["title1"]
  out$dir <- ifelse(startsWith(pps_out$output_id, "t"), "Tables",
                        ifelse(startsWith(pps_out$output_id, "f"), "Figures",
                               "Listings"))
  out$path <- pps_out$output_id
  out <- out[complete.cases(out), ]
  out$path <- file.path(path_prod, out$dir, "Output", paste0(out$path, ".pdf"))
  out$path <- normalizePath(out$path)
  out$dir <- NULL
  names(out) <- c("title", "path")
  return(out)
}

#' Read and format the PPS
#'
#' @param path_xlsx Path to the PPS
#' @param open_closed String that identifies which report to produced. Usually
#'   "open" or "closed"
#' @export
read_format_pps <- function(path_pps, open_closed) {
  pps <- read_pps(path_pps)
  out <- format_pps(pps, open_closed, path_prod = sub("/Metadata.+", "/Production", path_pps))
  return(out)
}
