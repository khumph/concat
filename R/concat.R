#' Concatenate PDF via LaTeX
#'
#' @param path_tlf_csv Path to a CSV file with with two columns: "title" with
#'   the title of each TLF and "path" with the path to the pdf file for the TLF.
#' @param toc Should a table of contents be included?
#' @param coverpage A character string of LaTeX to include for a coverpage.
#'   E.g., generated using \code{\link[concat]{add_cover_tex}}
#' @param path_tex The path to output the LaTeX document
#' @param path_pdf The path to output the PDF document
#' @param min_times The minimum and maximum number of times to rerun the LaTeX
#'   engine when using emulation. Needs to be at least 2 for correct page
#'   numbers in multi-page tables of contents.
#' @param ... Further arguments passed to \code{\link[tinytex]{pdflatex}}
#' @export
concat <- function(path_tlf_csv, toc = TRUE, coverpage = NULL, path_tex, path_pdf, min_times = 2, ...) {
  build_tex(path_tlf_csv, toc, coverpage, path_tex)
  tinytex::pdflatex(path_tex, min_times = min_times, pdf_file = path_pdf, ...)
}
