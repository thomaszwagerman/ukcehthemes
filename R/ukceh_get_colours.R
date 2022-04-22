#' Request a UKCEH colour palette
#'
#' @param palette_name the name of the colour palette
#'
#' @return string of hex colour codes
#' @export
#'
#' @examples
#' # Selecting the logo colours
#' ukceh_get_colours("logo")
#'
#' # Colours are stored in `ukceh_colours`
#' # You can call names(ukceh_colours) to see all options
ukceh_get_colours <- function(palette_name = NA) {
  if (missing(palette_name) | !(palette_name %in% names(ukceh_colours))) {
    stop("You need to supply a palette name, choose one of ",
         paste(names(ukceh_colours), collapse = ", "), ".")
  }

  colour_palette_requested <- ukceh_colours[[palette_name]]
  return(colour_palette_requested)
}
