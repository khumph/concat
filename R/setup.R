#' Install tinytex and required LaTeX packages
#' @export
concat_setup <- function(pkgs = c("geometry", "pdfpages", "hyperref")) {
  message("Installing tinytex and required LaTeX packages...")
  install.packages("tinytex")
  tinytex::install_tinytex()
  tinytex::tlmgr_install(pkgs)
  message("...done.")
}

#' Update R and LaTeX packages
#' @export
concat_update_latex_pkgs <- function() {
  update.packages(ask = FALSE, checkbuilt = TRUE)
  tinytex::tlmgr_update()
}

concat_resetup <- function() {
  tinytex::reinstall_tinytex()
}
