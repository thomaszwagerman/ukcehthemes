#' Return a UKCEH theme
#'
#' The result of this function should be used as the \code{theme} argument for
#' \code{\link[shiny]{bootstrapPage}}, \code{\link[shiny]{fluidPage}},
#' \code{\link[shiny]{navbarPage}}, or \code{\link[shiny]{fixedPage}}.
#'
#'
#' @param theme Name of a UKCEH theme.
#' 
#' @return  
#' @export
#'
#' @examples
#' \dontrun{
#' shinyApp(
#'   ui = fluidPage(theme = ukcehtheme("generic"),
#'     ...
#'   ),
#'   server = function(input, output) { }
#' )
#' }
ukcehtheme <- function(theme = NULL) {
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
