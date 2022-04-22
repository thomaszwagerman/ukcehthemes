test_that("error message is helpful", {
  expect_error(ukceh_get_colours(),
                 "You need to supply a palette name, choose one of logo, hero, primary_palette, highlight, extended_palette.")
  expect_error(ukceh_get_colours("x"),
               "You need to supply a palette name, choose one of logo, hero, primary_palette, highlight, extended_palette.")
})

test_that("return the right colours", {
  expect_equal(ukceh_get_colours("logo"),
               c("#007AC0", "#59B444"))
  expect_equal(ukceh_get_colours("hero"),
               c("#0483A4"))
  expect_equal(ukceh_get_colours("primary_palette"),
               c("#292C2F", "#1685A3", "#EAEFEC"))
  expect_equal(ukceh_get_colours("highlight"),
               c("#F49633"))
  expect_equal(ukceh_get_colours("extended_palette"),
               c("#8f7158", "#fee9cd", "#90c064",
                 "#37a635", "#00883c", "047e56",
                 "007370",  "#0383a4", "#c9e7f2",
                 "34b8c7", "009dcb",  "227fc1",
                 "0a5da4",  "00678e",  "f39532"))
})
