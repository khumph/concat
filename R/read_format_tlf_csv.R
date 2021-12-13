#' Read and format TLF CSV
#'
#' @param path_csv Path to a CSV file with with two columns: "title" with
#'   the title of each TLF and "path" with the path to the pdf file for the TLF.
read_format_tlf_csv <- function(path_csv) {
  toc_raw <- read.csv(path_csv, stringsAsFactors = FALSE)
  toc <- toc_raw
  toc$path <- gsub('"', "", gsub("\\\\", "/", toc$path))
  return(toc)
}
