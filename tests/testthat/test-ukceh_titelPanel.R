test_that("returns a shiny.tag", {
  panel <- ukceh_titlePanel()
  expect_s3_class(panel, "shiny.tag")
})
