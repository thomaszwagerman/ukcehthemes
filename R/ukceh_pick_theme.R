#' Return a UKCEH theme
#'
#' The result of this function should be used as the \code{theme} argument for
#' \code{\link[shiny]{bootstrapPage}}, \code{\link[shiny]{fluidPage}},
#' \code{\link[shiny]{navbarPage}}, or \code{\link[shiny]{fixedPage}}.
#'
#'
#' @param theme name of a UKCEH theme.
#'
#' @return a specified UKCEH bslib theme
#' @export
#'
#' @examples
#' if(interactive()) {
#' library(ukcehthemes)
#' shinyApp(
#'   ui = fluidPage(theme = ukceh_pick_theme("generic"),
#'     ...
#'   ),
#'   server = function(input, output) { }
#' )
#' }
ukceh_pick_theme <- function(theme = NULL) {
  # Check that theme exists
  if (is.null(theme) || !theme %in% all_themes()) {
    stop(theme, " is not an available theme. Valid themes are: ",
         paste(all_themes(), collapse = ", "), ".")
  }

  source(paste0("themes/", theme, ".R"))
  return(get(theme))
}

all_themes <- function() {
  themes <- dir("themes/")
  sub(".R", "", themes)
}
