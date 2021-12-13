test_that("PDF is created", {
  expect_snapshot_output(
    concat(path_tlf_csv = "test-files/toc.csv",
                   toc = TRUE,
                   coverpage = gen_cover_tex(study = "Test Sponsor Test Study",
                                             report_title = "Closed Report",
                                             purpose = "DMC Meeting",
                                             mtg_type = "Teleconference",
                                             mtg_date = "2021-12-13",
                                             start_time = "07:00",
                                             end_time = "10:00",
                                             tzone = "America/Los_Angeles",
                                             tzones = c("America/Los_Angeles", "America/New_York", "Europe/London"),
                                             cutoff_snapshot = "Snapshot",
                                             dco_date = "2021-11-10",
                                             conf_statement = "This document is confidential"),
                   path_tex = "test-files/test.tex",
                   path_pdf = "test-files/test.pdf")
  )
})
