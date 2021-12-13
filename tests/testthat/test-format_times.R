test_that("Removing leading zeros works", {
  expect_equal(remove_leading_zero("07:00"), "7:00")
})

test_that("Changing timezones works", {
  expect_equal(format_time("2021-12-19 07:00", "America/Los_Angeles"), "07:00 AM PST")
})

test_that("Formatting timezones works", {
  expect_equal(
    format_times(
      "2021-12-19",
      "07:00",
      "09:00",
      "America/Los_Angeles",
      c("America/Los_Angeles",
        "America/New_York")
    ),
    c("America/Los_Angeles" = "7:00 AM PST - 9:00 AM PST",
      "America/New_York" = "10:00 AM EST - 12:00 PM EST")
  )
})


test_that("Formatting dates works", {
  expect_equal(format_date("2021-12-13"), "Monday December 13, 2021")
})
