# test_that("returns bs_theme", {
#   print(getwd())
# # This test annoyingly doesn't work because it relies on a directory in
# # the package
#   requested_theme <- ukceh_pick_theme("generic")
#   expect_equal(class(requested_theme)[2], "bs_theme")
# })

test_that("returns warning", {
  expect_error(ukceh_pick_theme())
  expect_error(ukceh_pick_theme("random string"),
               "is not an available theme. Valid themes are: .")
})
