writeLines("title,path\nOne,Folder/file.pdf\nTwo,Folder\\file2.pdf",
           "test.csv")

test_that("CSV is read properly", {
  expect_equal(read_format_tlf_csv("test.csv"),
               data.frame(
                 title = c("One", "Two"),
                 path = c("Folder/file.pdf", "Folder/file2.pdf")
               ))
})

file.remove("test.csv")
