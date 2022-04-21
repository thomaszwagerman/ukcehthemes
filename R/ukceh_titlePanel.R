# UKCEH titlePanel replacement
#'
#' @param title 
#' @param windowTitle 
#'
#' @return
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
ukceh_titlePanel <- function(title = "UKCEH Shiny app", windowTitle = title){
  
  div(
    img(src="https://www.ceh.ac.uk/sites/default/files/images/theme/ukceh_logo_long_720x170_rgb.png",style="height: 50px;vertical-align:middle;"),
    
    h2(  
      title,
      style ='vertical-align:middle; display:inline;padding-left:40px;'
    ),
    tagList(tags$head(tags$title(paste0(windowTitle," | UK Centre for Ecology & Hydrology")),
                      tags$link(rel="shortcut icon", href="https://brandroom.ceh.ac.uk/themes/custom/ceh/favicon.ico"))),
    style = "padding: 30px;"
  )
}