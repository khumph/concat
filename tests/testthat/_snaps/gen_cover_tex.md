# Cover page is pasted together

    Code
      cat(paste_cover_tex(study = "Study Name", report_title = "Closed", purpose = "DMC Meeting",
        mtg_type = "Teleconference", mtg_date = "2021-12-10", mtg_times = c(
          "7:00 AM - 10:00 AM PST", "10:00 AM - 1:00 PM EST"), cutoff_snapshot = "Shapshot",
        dco_date = "2021-11-10", conf_statement = "This is a confidential document"))
    Output
      
      % Cover Page ----------------------------------------------------------------
      \begin{titlepage}
      \begin{center}
      {\huge \bfseries
      
      Study Name
      
      \vfill
      
      Closed
      
      \vfill
      
      DMC Meeting
      
      Teleconference
      
      \vfill
      
      2021-12-10
      
      7:00 AM - 10:00 AM PST
      
      10:00 AM - 1:00 PM EST
      
      }
      
      \vfill
      
      Data Shapshot Date: 2021-11-10
      
      \vfill
      
      \textbf{Confidentiality Statement}
      
      This is a confidential document
      
      \end{center}
      \end{titlepage}
      
      % ----------------------------------------------------------------------------

# Cover page is formatted, then pasted together

    Code
      cat(gen_cover_tex(study = "Test Sponsor Test Study", report_title = "Closed Report",
        purpose = "DMC Meeting", mtg_type = "Teleconference", mtg_date = "2021-12-13",
        start_time = "07:00", end_time = "10:00", tzone = "America/Los_Angeles",
        tzones = c("America/Los_Angeles", "America/New_York", "Europe/London"),
        cutoff_snapshot = "Snapshot", dco_date = "2021-11-10", conf_statement = "This document is confidential"))
    Output
      
      % Cover Page ----------------------------------------------------------------
      \begin{titlepage}
      \begin{center}
      {\huge \bfseries
      
      Test Sponsor Test Study
      
      \vfill
      
      Closed Report
      
      \vfill
      
      DMC Meeting
      
      Teleconference
      
      \vfill
      
      Monday December 13, 2021
      
      7:00 AM PST - 10:00 AM PST
      
      10:00 AM EST - 1:00 PM EST
      
      3:00 PM GMT - 6:00 PM GMT
      
      }
      
      \vfill
      
      Data Snapshot Date: November 10, 2021
      
      \vfill
      
      \textbf{Confidentiality Statement}
      
      This document is confidential
      
      \end{center}
      \end{titlepage}
      
      % ----------------------------------------------------------------------------

