#' UKCEH titlePanel replacement
#' @param apptitle the title of the app itself.
#'
#' @details this function replaces titlePanel() and adds a title in the format
#' "`apptitle` | UK Centre for Ecology and Hydrology", the UKCEH logo and a
#' favicon for the browser tab.
#'
#' @return shiny tag to replace titlePanel() with
#' @export
#'
#' @examples
#' \dontrun{
#' ui <- fluidPage(
#' theme = UKCEH_theme,
#' UKCEH_titlePanel("My first Shiny app"),
#' sidebarLayout(
#'   sidebarPanel(
#'     ...
#'   ),
#'   mainPanel(
#'     ...
#'   )
#' )
#' )
#'
#' }
ukceh_titlePanel <- function(apptitle = "UKCEH Shiny app") {
  htmltools::div(
    htmltools::img(
      src = "https://www.ceh.ac.uk/sites/default/files/images/theme/ukceh_logo_long_720x170_rgb.png",
      style = "height: 50px;vertical-align:middle;"),
    htmltools::h2(
      apptitle,
      style = "vertical-align:middle; display:inline;padding-left:40px;"
    ),
    htmltools::tagList(
      htmltools::tags$head(
        htmltools::tags$title(
          paste0(apptitle, " | UK Centre for Ecology & Hydrology")),
        htmltools::tags$link(
          rel = "shortcut icon",
          href = "https://brandroom.ceh.ac.uk/themes/custom/ceh/favicon.ico"))),
    style = "padding: 30px;"
  )
}