test_that("returns a shiny.tag", {
  library(shiny)
  panel <- ukceh_titlePanel()
  expect_equal(class(panel), "shiny.tag")
})
