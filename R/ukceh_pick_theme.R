#' Return a UKCEH theme
#'
#' The result of this function should be used as the \code{theme} argument for
#' \code{\link[shiny]{bootstrapPage}}, \code{\link[shiny]{fluidPage}},
#' \code{\link[shiny]{navbarPage}}, or \code{\link[shiny]{fixedPage}}.
#'
#'
#' @param theme name of a UKCEH theme.
#' 
#' @return  
#' @export
#'
#' @examples
#' if(interactive()) {
#' library(shiny)
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
  if (is.null(theme) || !theme %in% allThemes()) {
    stop(theme, " is not an available theme. Valid themes are: ",
         paste(allThemes(), collapse = ", "), ".")
  }
  
  source(paste0("inst/", theme, ".R"))
  return(get(theme))
}

allThemes <- function() {
  themes <- dir("inst")
  sub(".R", "", themes)
}
