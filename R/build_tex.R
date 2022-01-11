#' Build LaTeX string of concatenated report
#'
#' @param tlfs Data frame with columns for section titles for each TLF
#'   ("section", "subsection", "subsubsection") and "path" with the path to the
#'   pdf file for the TLF.
#' @param toc Should a table of contents be included?
#' @param coverpage A character string of LaTeX to include for a coverpage.
paste_tex <- function(tlfs, toc, coverpage) {
  header_tex <- "\\documentclass{article}
\\usepackage[landscape]{geometry}
\\renewcommand{\\rmdefault}{phv}
\\renewcommand{\\sfdefault}{phv}
\\usepackage{pdfpages}
\\usepackage[colorlinks=true,linkcolor=black]{hyperref}
\\setlength{\\footskip}{1.2in}
\\setcounter{secnumdepth}{0} % sections and below are not numbered

\\begin{document}

"
  if (is.null(coverpage)) {
    start_tex <- header_tex
  } else if (isTRUE(is.character(coverpage))) {
    start_tex <- paste0(header_tex, coverpage)
  }

  if (toc) {
    start_tex <- paste0(start_tex,
"
% Table of Contents ----------------------------------------------------------
\\addtocounter{page}{1}
\\thispagestyle{empty}
\\tableofcontents
\\thispagestyle{empty}
\\newpage

% ----------------------------------------------------------------------------

")
  }

  middle <- paste_middle(tlfs)

  middle_tex <- stringr::str_replace_all(middle, c(
    " &parameter." = "",
    '%' = '\\\\%',
    "&" = "\\\\&"
  ))

  end_tex <- "
\\end{document}
"

  out_tex <- paste0(start_tex, middle_tex, end_tex)
  return(out_tex)
}


#' Build LaTeX string of the items to add
#'
#' @param tlfs Data frame with columns for section titles for each TLF
#'   ("section", "subsection", "subsubsection") and "path" with the path to the
#'   pdf file for the TLF.
paste_middle <- function(tlfs) {

  for (x in names(tlfs)) {

  }
  text <- paste0(
    add_section("section", tlfs),
    add_section("subsection", tlfs),
    add_section("subsubsection", tlfs),
    ifelse(is.na(tlfs["path"]),
           "",
           paste0("\\includepdf[pages=-, pagecommand = {}]{", tlfs$path, "}\n\n"))
  )

  middle <- paste(text, collapse = "")
  return(middle)
}

#' Add a section
#'
#' @param x the name of the section to add (either "section", "subsection", or "subsubsection")
#' @param tlfs Data frame with columns for section titles for each TLF
#'   ("section", "subsection", "subsubsection") and "path" with the path to the
#'   pdf file for the TLF.
add_section <- function(x, tlfs) {
  if (is.null(tlfs[[x]])) {
    return("")
  }
  out <- ifelse(is.na(tlfs[[x]]),
                "",
                paste0("\\phantomsection\n\\addcontentsline{toc}{", x, "}{", tlfs[[x]], "}\n"))
  return(out)
}

#' Build LaTeX document of concatenated report
#'
#' @param path_tlf_csv Path to a CSV file with with two columns: "title" with
#'   the title of each TLF and "path" with the path to the pdf file for the TLF.
#' @param toc Should a table of contents be included?
#' @param coverpage A character string of LaTeX to include for a coverpage.
#' @export
build_tex <- function(path_tlf_csv, toc = TRUE, coverpage = NULL, path_tex) {
  dat_tlf <- read_format_tlf_csv(path_tlf_csv)
  tex <- paste_tex(dat_tlf, toc, coverpage)
  writeLines(tex, path_tex)
}
