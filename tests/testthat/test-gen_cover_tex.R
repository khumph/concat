test_that("Cover page is pasted together", {
  expect_snapshot(cat(
    paste_cover_tex(
      study = "Study Name",
      report_title = "Closed",
      purpose = "DMC Meeting",
      mtg_type = "Teleconference",
      mtg_date = "2021-12-10",
      mtg_times = c("7:00 AM - 10:00 AM PST", "10:00 AM - 1:00 PM EST"),
      cutoff_snapshot = "Shapshot",
      dco_date = "2021-11-10",
      conf_statement = "This is a confidential document"
    )
  ))
})

test_that("Cover page is formatted, then pasted together", {
  expect_snapshot(cat(
    gen_cover_tex(study = "Test Sponsor Test Study",
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
                  conf_statement = "This document is confidential")
  ))
})
