format_date <- function(date_in, format = "%A %B %d, %Y") {
  date_out <- as.Date(date_in)
  date_out <- format(date_out, format)
  date_out <- remove_leading_zeros(date_out)
  return(date_out)
}

format_inputs <- function(input) {
  output <- input
  output$mtg_date <- format_date(input$mtg_date)
  output$dco_date <- format_date(input$dco_date, "%B %d, %Y")
  output$mtg_times <- format_times(input$mtg_date, input$start_time,
                                   input$end_time, input$tzone, input$tzones)
}


build_tex <- function(study, coverpage = TRUE, open_closed, purpose, mtg_type, mtg_date,
          mtg_times, cutoff_snapshot, dco_date, conf_statement) {
  header_tex <- "\\documentclass{article}
\\usepackage[landscape]{geometry}
\\renewcommand{\\rmdefault}{phv}
\\renewcommand{\\sfdefault}{phv}
\\usepackage{pdfpages}
\\usepackage[colorlinks=true,linkcolor=black]{hyperref}
\\setlength{\\footskip}{1.2in}
\\setcounter{secnumdepth}{0} % sections and below are not numbered

\\begin{document}"

if (coverpage) {
  mtg_date_out <- format_date(mtg_date, "%A %B %d, %Y")
  dco_date_out <- format_date(dco_date, "%B %d, %Y")

  mtg_times <- format_times(mtg_date, start_time, end_time, tzone, tzones)
  cover_toc_tex <- build_cover_toc_tex(study, open_closed, purpose, mtg_type, mtg_date,
                                       mtg_times, cutoff_snapshot, dco_date, conf_statement)
}

  toc <- read.csv(path_toc, stringsAsFactors = FALSE)

  text <- paste0(
    "\\phantomsection\n",
    "\\addcontentsline{toc}{subsection}{", toc$title, "}\n",
    "\\includepdf[pages=-, pagecommand = {}]{", file.path(dir_outputs, toc$file), ".pdf}\n"
  )

  middle <- paste(text, collapse = "")

  middle_tex <- stringr::str_replace_all(middle, c(
    " &parameter." = "",
    '%' = '\\\\%',
    "&" = "\\\\&"
  ))

  end_tex <- "
\\end{document}
"

  out_tex <- paste0(start, middle, end)

  dir_cat <- file.path(proj_dir, dir_out)
  if (!dir.exists(dir_cat)) {
    dir.create(dir_cat)
  }
  writeLines(out_tex, file.path(dir_cat, output_file))
}

#' Build the cover page and TOC .tex
#'
#' @param input A list with any of the following named elements. If an element
#'   is not provided. It will be left blank in the output.
#'   1. \code{study} The name of the study to use as the title
#'   2. \code{open_closed} "Open" or "Closed" for the open or closed reports.
#'   3. \code{purpose} Usually "DMC Meeting"
build_cover_toc_tex <- function(study, open_closed, purpose, mtg_type, mtg_date,
                                mtg_times, cutoff_snapshot, dco_date, conf_statement) {
paste0("\\begin{titlepage}
\\begin{center}
{\\huge

\\textbf{", study , "}

\\vfill

\\textbf{", open_closed, " Report}

\\vfill

\\textbf{", purpose, "}

\\textbf{", mtg_type, "}

\\vfill

\\textbf{", mtg_date, "}",
       paste0("\n\\textbf{", mtg_times, "}\n"),
"
}

\\vfill

Data ", cutoff_snapshot, "Date: ", dco_date, "

\\vfill

\\textbf{Confidentiality Statement}

", conf_statement ,"

\\end{center}
\\end{titlepage}

\\addtocounter{page}{1}
\\thispagestyle{empty}
\\tableofcontents
\\thispagestyle{empty}
\\newpage

")
}

##############################################################################################################################
# Creation of a bookmarked pdf report with cover page and table of content, from a list of individual outputs in PDF format
#
#   Requirements:
#     - folder containing individual outputs in pdf format
#     - csv file containing TOC with two columns: OUTPUT_ID (file name), TITLE (strings to be used as bookmark and in the TOC)
##############################################################################################################################


###########################################
# Step 0: Installation
# To be executed only once before the
# first utilization, of if errors during
# the final compliation
###########################################


### Run the 5 lines below before the first utilization: this will install necessary packages, update all existing packages and install tex ###
###########################################
# Step 1 : Set Parameters
#
###########################################




###########################################
# Step 1.1 (Optional) : format conversion
#
# Convert individual outputs from ps format to pdf forma
# Assumes the files in .ps are saved under ./outputs/PS
#
###########################################
# output_dir <- file.path(proj_dir, "outputs")
# toc <- readr::read_csv(path_toc)
# setwd(output_dir)
# for (id in toc$OUTPUT_ID){
#   system(paste("ps2pdf ./PS/",id,".ps ",id,".pdf",sep=""))
# }

###########################################
# Step 2 : Execute
#
# Run all the script below to generate the
# Combined Report
###########################################



