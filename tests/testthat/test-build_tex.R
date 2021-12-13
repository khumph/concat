tlfs <- data.frame(
  title = c("One", "Two"),
  path = c("Folder/file.pdf", "Folder/file2.pdf")
)

test_that("Tex is created", {
  expect_snapshot(cat(paste_tex(tlfs, toc = FALSE, coverpage = NULL)))
})

test_that("Tex is created with a table of contents", {
  expect_snapshot(cat(paste_tex(tlfs, toc = TRUE, coverpage = NULL)))
})

test_that("Tex is created with a cover page", {
  expect_snapshot(cat(
    paste_tex(tlfs,
              toc = FALSE,
              coverpage = "\n\n\\begin{titlepage}\n\nThis is not really a cover page\n\n\\end{titlepage}\n\n")
  ))
})

