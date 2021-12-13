#' Install tinytex and required LaTeX packages
#' @export
concat_setup <- function(pkgs = c("geometry", "pdfpages", "hyperref")) {
  message("Installing tinytex R package...")
  install.packages("tinytex")
  message("...done.")

  message("Installing tinytex...")
  tinytex::install_tinytex()
  message("...done.")

  message("Installing required LaTeX packages...")
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
